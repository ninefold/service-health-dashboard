class Event < ActiveRecord::Base
  belongs_to :service
  belongs_to :status
  belongs_to :event_type
  belongs_to :incident
  attr_accessible :description, :informational, :invisible, :message, :start, :service_id, :event_type_id, :status_id
end
