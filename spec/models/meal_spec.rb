require 'spec_helper'

describe Meal do
  before do
    @menu = create(:menu) 
    @meal = create(:meal, menu_id: @menu.id)
    @item = build(:menu_item)
  end

  it "belongs to a menu" do
    @meal.menu.should eq @menu
  end

  it "belongs to a table" do
    @meal.table.should be_valid
  end

  it "has many menu items" do
    @meal.menu_items << @item
    @meal.menu_items.should include @item
  end

  it "belongs to a table" do
    @meal.table.should_not be_nil
  end


end
