class CreateGauges < ActiveRecord::Migration
	def self.up
		create_table :gauges do  |t|
			t.string :units, :type, :code
			t.decimal :lat, :lng
			t.integer :river
			t.timestamps
		end
	end
	
	def self.down
		drop_table :gauges
	end
end