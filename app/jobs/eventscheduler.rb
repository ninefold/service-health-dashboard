require 'time'
module EventScheduler
  @queue = :event_schedule
  
  def self.perform(event_id)
  	event = Event.find(event_id)
  	p "Exposing event "+event.to_s
  	event.invisible = false
  	event.save
  end
end