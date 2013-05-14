class Service < ActiveRecord::Base
	belongs_to :dependent
	attr_accessible :description, :name, :order, :slug, :version, :service_id

	def current_status
		Event.where("service_id="+self.id.to_s).order("start").last
	end

	def most_severe_status_for_date(date)
    puts date.beginning_of_day()
    puts date.end_of_day()
		events = Event.where(
			'service_id = ? AND start BETWEEN ? AND ?',
			self.id.to_s, 
			date.utc.beginning_of_day(), 
			date.utc.end_of_day()).order('start').last
	end

  def x_days_statuses(days_to_go_back)
    events = []
    day = DateTime.now - days_to_go_back
    days = (day .. day + days_to_go_back).to_a { |date|  "#{date}" }
    for day in days
      events << most_severe_status_for_date(day)
    end
    events
  end
end
