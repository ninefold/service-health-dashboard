class Event < ActiveRecord::Base
  belongs_to :service
  belongs_to :status
  belongs_to :event_type
  #belongs_to :incident
  attr_accessible :description, :informational, :invisible, :message, :start, :service_id, :event_type_id, :status_id
  after_create :schedule




  def self.maintenance
  	where(start: Time.now.utc..90.days.from_now.end_of_day).
  		where(invisible: false).
  			where(status_id: 2)
  end
  def to_s
    message
  end

  private

  def schedule
    if self.start > DateTime.now && self.invisible = true
      es = EventScheduler
      p "Scheduling event expose in "+(self.start - DateTime.now).abs.round.to_s
      Resque.enqueue_in((self.start - DateTime.now).abs.round, es, self.id)
    end
  end

end
