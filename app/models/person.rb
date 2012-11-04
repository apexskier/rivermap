require 'digest/sha2'

class Person < ActiveRecord::Base
	attr_reader :password
	
	ENCRYPT = Digest::SHA256
	
	has_many :sessions, :dependent => :destroy
	
	validates_presence_of :username, :message => "is required"
	validates_presence_of :email, :message => "is required"
	validates_presence_of :password, :message => "is required"
	
	validates_uniqueness_of :username, :message => "is already in use by another person"
	validates_uniqueness_of :email, :message => "is already in use by another person"
	
	validates_format_of :username, :with => /^([a-z0-9_]{2,16})$/i,
		:message => "must be 4 to 16 letters, numbers or underscores and have no spaces"
	validates_format_of :password, :with => /^([\x20-\x7E]){4,16}$/,
		:message => "must be 4 to 16 characters",
		:unless => :password_is_not_being_updated?
	
	validates_confirmation_of :password
	
	before_save :scrub_username
	after_save :flush_passwords
	
	attr_accessible :first, :last, :username, :email, :password, :password_confirmation
	
	def self.find_by_username_and_password(username, password)
		person = self.find_by_username(username)
		if person and person.encrypted_password == ENCRYPT.hexdigest(password + person.salt)
			return person
		end
	end
	
	def password=(password)
		@password = password
		unless password_is_not_being_updated?
			self.salt = [Array.new(9){rand(256).chr}.join].pack('m').chomp
			self.encrypted_password = ENCRYPT.hexdigest(password + self.salt)
		end
	end
	
	private
	
	def scrub_username
		self.username.downcase!
	end
	
	def flush_passwords
		@password = @password_confirmation = nil
	end
	
	def password_is_not_being_updated?
		self.id and self.password.blank?
	end
end
