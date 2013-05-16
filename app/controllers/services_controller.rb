class ServicesController < ApplicationController
  def index
  	@nf1_services = Service.where('version=1 AND invisible=false').all

  	@nf2_services = Service.where('version=2 AND invisible=false').all

    @date = Date.today.strftime("%d/%m")

  	@statuses = Status.all

  	@maintenance = Event.where(
      'invisible=? AND start BETWEEN ? AND ?',
      true, 
      DateTime.now.beginning_of_day(), 
      DateTime.now+90.days).order('start').last

    days_to_go_back = 3
    @day = DateTime.now - days_to_go_back
    @days = (@day .. @day + days_to_go_back).to_a { |date| "#{date}" }

    @days.reverse!
  end

  def show
    @service = Service.find(params[:id])
    @events = Event.where("service_id="+@service.id.to_s)
    respond_to do |format|
      format.html
      format.json { render json: @service }
    end
  end

  def nf1
    @nf1_services = Service.where('version=1 AND invisible=false').all
    @statuses = Status.all
    @maintenance = Event.where(
      'invisible=? AND start BETWEEN ? AND ?',
      true, 
      DateTime.now.beginning_of_day(), 
      DateTime.now+90.days).order('start').last
  end

  def nf2
    @nf2_services = Service.where('version=2 AND invisible=false').all
    @statuses = Status.all
    @maintenance = Event.where(
      'invisible=? AND start BETWEEN ? AND ?',
      true, 
      DateTime.now.beginning_of_day(), 
      DateTime.now+90.days).order('start').last
  end


end


