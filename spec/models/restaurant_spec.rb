require 'spec_helper'

describe Restaurant do
  before do
    @restaurant = create(:restaurant)
    @table = create(:table, restaurant_id: @restaurant.id)
    @menu = create(:menu, restaurant_id: @restaurant.id)
    @meal = create(:meal, table_id: @table.id)
  end

  it "has many tables" do
    @restaurant.tables.should include @table
  end

  it "has many menus" do
    @restaurant.menus.should include @menu
  end

  it "has many meals through tables" do
    @restaurant.meals.should include @meal
  end

end
