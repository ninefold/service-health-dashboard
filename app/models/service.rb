class Service < ActiveRecord::Base
	belongs_to :dependent
	attr_accessible :description, :name, :order, :slug, :version, :invisible, :service_id

	def current_status()
		e = Event.where("service_id="+self.id.to_s).order("start").last
    e == nil ? Status.find(1) : e.status
	end


	def most_severe_status_for_date(date)
		events = Event.where(
			'service_id = ? AND invisible=? AND start BETWEEN ? AND ?',
			self.id.to_s,
      true, 
			date.utc.beginning_of_day(), 
			date.utc.end_of_day()).order('start').last
	end

  def x_days_statuses(days_to_go_back)
    events = []
    day = DateTime.now - days_to_go_back
    days = (day .. day + days_to_go_back).to_a { |date|  "#{date}" }

    #adds a second "today" for displaying the current status vs the daily severity status
    days << days.last
    days.reverse!

    for day in days
      events << most_severe_status_for_date(day)
    end
    events
  end
end
