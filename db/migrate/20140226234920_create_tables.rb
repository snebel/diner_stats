class CreateTables < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :max_seats
      t.integer :restaurant_id
    end
  end
end
