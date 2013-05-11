class Status < ActiveRecord::Base
  belongs_to :severity
  attr_accessible :description, :image, :name, :slug, :severity_id
end
