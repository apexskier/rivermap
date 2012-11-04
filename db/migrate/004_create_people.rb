class CreatePeople < ActiveRecord::Migration
	def self.up
		drop_table :people
		create_table :people do  |t|
			t.string :username, :first, :last, :email, :salt, :encrypted_password
			t.timestamps
		end
	end
	
	def self.down
		drop_table :people
	end
end
