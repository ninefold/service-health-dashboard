class Service < ActiveRecord::Base
  belongs_to :dependent
  attr_accessible :description, :name, :order, :slug, :version
end
