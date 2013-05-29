require 'time'
module EventScheduler
  @queue = :event_schedule
  
  def self.perform(event)
  	puts event
  end
end