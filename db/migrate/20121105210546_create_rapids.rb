class CreateRapids < ActiveRecord::Migration
  def change
    create_table :rapids do |t|
      t.string :name
      t.integer :class
      t.integer :river
      t.decimal :lat
      t.decimal :lng
      t.text :description
      t.text :user_created
      t.text :user_changed

      t.timestamps
    end
  end
end
