class ServicesController < ApplicationController

  before_filter :authenticate_user, :only => [:create, :new, :update, :edit]

  caches_action :index, :show, :nf1, :nf2, :expires_in => 3.minutes



  def date_range
    days_to_go_back = 3
    @day = DateTime.now - days_to_go_back
    @days = (@day .. @day + days_to_go_back).to_a { |date| '#{date}' }
    @days.reverse!
  end

  def expire
    expire_action :action=>:index
    redirect_to '/'
  end

  def index
  	@nf1_services = Service.where('version=1 AND invisible=false').all
  	@nf2_services = Service.where('version=2 AND invisible=false').all
  	@statuses = Status.all
  	@maintenance = Event.maintenance
    days = date_range
    
  end


  def show
    @service = Service.find(params[:id])
    #@service = Service.where('slug = ?',params[:slug]).last
    @events = Event.where('service_id='+@service.id.to_s).
                    where('start < ?', DateTime.now).
                    where('start>=?', DateTime.now+4.days).
                    where('invisible = ?', false).
                    order('start DESC')
    @maintenance = Service.maintenance(service=@service.id).
                    order('start DESC')

    respond_to do |format|
      format.html { render :template => 'services/show' }
      format.json { render json: @service }
    end
  end

  def nf1
    @nf1_services = Service.where('version=1 AND invisible=false').all
    @statuses = Status.all
    @maintenance = Service.maintenance(nf_version=1)
    days = date_range
  end

  def nf2
    @nf2_services = Service.where('version=2 AND invisible=false').all
    @statuses = Status.all
    @maintenance = Service.maintenance(nf_version=2)
    days = date_range
  end


  def edit
    @service = Service.find(params[:id])
  end


  def new
    @service = Service.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @service }
    end
  end   

  def create
    @service = Service.new(params[:service])

    respond_to do |format|
      if @service.save
        format.html { redirect_to '/', notice: 'Service was successfully created.' }
        format.json { render json: @service, status: :created, location: @service }
      else
        format.html { render action: 'new' }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    @service = Service.find(params[:id])

    respond_to do |format|
      if @service.update_attributes(params[:service])

        format.html { redirect_to '/', notice: 'Service was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @service.errors, status: :unprocessable_entity }
      end
    end
  end


end


