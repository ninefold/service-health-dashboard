class ServicesController < ApplicationController
  def index
  	@services = Service.all
  	@statuses = Status.all
  	
  end
end
