class AddDefaultsToMeals < ActiveRecord::Migration
  def change
    change_column_default :meals, :duration, 0
    change_column_default :meals, :price, 0
  end
end
