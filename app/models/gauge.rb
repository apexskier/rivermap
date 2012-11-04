class Gauge < ActiveRecord::Base
  attr_accessible :user, :code, :river, :lng, :lat
  
  validates_presence_of :code
  validates_presence_of :lat
  validates_presence_of :lng
  validates_uniqueness_of :code, :message => "already exists"
end
