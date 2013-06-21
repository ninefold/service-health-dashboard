require 'time'
module CacheExpirer
  @queue = :event_schedule
  
  def self.perform(id)
    p '10s cache expiring'
    p '10s cache expired'
  end
end