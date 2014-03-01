class ChangeMealsTable < ActiveRecord::Migration
  def change
    remove_column :meals, :duration
    add_column :meals, :duration, :integer
    add_column :meals, :price, :float
    add_column :meals, :tip, :float
  end
end
