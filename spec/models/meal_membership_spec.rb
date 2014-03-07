require 'spec_helper'

describe MealMembership do
  before do
    @meal = create(:meal)
    @item = create(:menu_item)
    @meal.menu_items << @item
  end

  it "gets created when an item is added to a meal" do
    MealMembership.where(
      meal_id: @meal.id,
      menu_item_id: @item.id
    ).should_not be_empty
  end

  # it "gets deleted when a meal is deleted" do
  #   Meal.destroy(@meal.id)
  #   MealMembership.where(
  #     meal_id: @meal.id,
  #     menu_item_id: @item.id
  #   ).should be_empty
  # end
  
end
