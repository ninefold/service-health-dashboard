class ServicesController < ApplicationController
  def date_range
    days_to_go_back = 3
    @day = DateTime.now - days_to_go_back
    @days = (@day .. @day + days_to_go_back).to_a { |date| '#{date}' }
    @days.reverse!
  end

  def index
  	@nf1_services = Service.where('version=1 AND invisible=false').all
  	@nf2_services = Service.where('version=2 AND invisible=false').all
  	@statuses = Status.all
  	@maintenance = Event.maintenance
    days = date_range
    
  end



  def show
    @service = Service.where('slug = ?',params[:slug]).last
    @events = Event.where('service_id='+@service.id.to_s).
                    where('start < ?', DateTime.now).
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


end


