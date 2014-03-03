class AddLeftTopToTables < ActiveRecord::Migration
  def change
    add_column :tables, :top, :integer
    add_column :tables, :left, :integer
  end
end
