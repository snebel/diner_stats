class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.time :duration
      t.integer :diners
      t.integer :menu_id
      t.integer :table_id
      t.timestamps
    end
  end
end
