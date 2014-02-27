require 'spec_helper'

describe Menu do
  before do
    @menu = create(:menu)
    @apps = create(:section, menu_id: @menu.id)
    @mains = create(:section, menu_id: @menu.id)
    @item = create(:menu_item, section_id: @apps.id)
    @meal = create(:meal, menu_id: @menu.id)
  end

  it "belongs to a restaurant" do
    @menu.restaurant.should be_valid
  end

  it "has many sections" do
    @menu.sections.should include @apps
    @menu.sections.should include @mains
  end

  it "has menu items from multiple sections" do
    @menu.menu_items.should eq @apps.menu_items + @mains.menu_items
  end

  it "has many meals" do
    @menu.meals.should include @meal
  end
end
