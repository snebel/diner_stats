require 'spec_helper'

describe Section do
  before do
    @menu = Menu.create(name: "Dinner")
    @apps = Section.create(name: 'Appetizers', menu_id: @menu.id)
    @item = MenuItem.create(
      name: 'food',
      price: 10.99,
      section_id: @apps.id
    )
  end

  it "has a name" do
    @apps.name.should eq 'Appetizers'
  end

  it "has many food items" do
    @apps.menu_items.should include @item
  end

  it "belongs to a menu" do
    @apps.menu.should eq @menu
  end

end
