class Service < ActiveRecord::Base
  belongs_to :dependent
  attr_accessible :description, :name, :order, :slug, :version, :service_id

  def current_status
  	Event.where("service_id="+self.id.to_s).order("start")[-1]
  end

  def most_severe_status_for_date(date)
  	events = Event.where('service_id = ? AND start BETWEEN ? AND ?', self.id.to_s, DateTime.now.beginning_of_day, DateTime.now.end_of_day).order('start')[-1]
  end
end
