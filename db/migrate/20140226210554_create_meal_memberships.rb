class CreateMealMemberships < ActiveRecord::Migration
  def change
    create_table :meal_memberships do |t|
      t.integer :menu_item_id
      t.integer :meal_id
      t.timestamps
    end
  end
end
