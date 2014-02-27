require 'spec_helper'

describe MenuItem do
  before do
    @item = build(:menu_item)
    @meal = build(:meal)
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

end
