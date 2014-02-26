require 'spec_helper'

describe Section do
  before do
    @apps = create(:section)
    @item = create(:menu_item, section_id: @apps.id)
  end

  it "has a name" do
    @apps.name.should eq 'Appetizers'
  end

  it "has many food items" do
    @apps.menu_items.should include @item
  end

  it "belongs to a menu" do
    @apps.menu.should_not be_nil
  end

end
