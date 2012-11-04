class River < ActiveRecord::Base
	attr_accessible :name, :user

	has_many :gauges, :dependent => :destroy

	validates_presence_of :name
	validates_uniqueness_of :name, :message => "already exists"
end
