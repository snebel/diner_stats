require 'spec_helper'

describe MenuItem do
  before do
    @menu = create(:menu)
    @apps = create(:section, menu_id: @menu.id)
    @mains = create(:section, menu_id: @menu.id)
    @item = create(:menu_item, section_id: @apps.id)
    @meal = create(:meal, menu_id: @menu.id)
    MealMembership.create(meal_id: @meal.id, menu_item_id: @item.id)
  end

  it "has a name and price" do
    @item.name.should eq 'food'
    @item.price.should eq 1.99
  end

  it "can be added to the appetizers section" do
    @item.section.name.should eq "Appetizers"
  end

  it "has many meals" do
    @item.meals << @meal
    @item.meals.should include @meal
  end

  it "has a good string representation" do
    @item.to_s.should eq "food (Appetizers $1.99)"
  end

  it "can determine the total revenue it accounts for" do
    @item.item_revenue.should eq 1.99
  end

  it "can determine what percent of all ordered items it acccounts for" do
    @item.item_percent.should eq 100.0
    @item2 = create(:menu_item)
    MealMembership.create(meal_id: @meal.id, menu_item_id: @item2.id)
    @item.item_percent.should eq 50.0
  end

  it "can determine the percent of meals its been ordered in" do
    @item.meal_percent.should eq 100.0
    @meal2 = create(:meal, menu_id: @menu.id)
    @item.meal_percent.should eq 50.0
  end

end
