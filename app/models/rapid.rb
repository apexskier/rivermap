class Rapid < ActiveRecord::Base
	attr_accessible :rating, :description, :lat, :lng, :name, :river, :user_changed, :user_created

	validates_presence_of :lat
	validates_presence_of :lng
	validates_presence_of :rating
end
