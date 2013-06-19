require 'time'
module CacheExpirer
  @queue = :page_expirer
  
  def self.perform(event_id)
    expire_action(:controller => '/services', :action => 'index')
    expire_action(:controller => '/services', :action => 'show')
    expire_action(:controller => '/services', :action => 'nf1')
    expire_action(:controller => '/services', :action => 'nf2')
    p '5 minute cache expiry'
  end
end