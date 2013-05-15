class ServicesController < ApplicationController
  def index
  	@nf1_services = Service.where('version=1 AND invisible=false').all
  	@nf2_services = Service.where('version=2 AND invisible=false').all
  	@statuses = Status.all

  end
end
