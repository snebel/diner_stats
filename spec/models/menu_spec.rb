require 'spec_helper'

describe Menu do
  before do
    @menu = Menu.create(name: "Dinner")
    @apps = Section.create(name:"Appetizers", menu_id: @menu.id)
    @mains = Section.create(name: "Mains")
    @item = MenuItem.create(
      name: 'food',
      price: 10.99,
      section_id: @apps.id
    )
    @menu.sections << @mains
  end

  it "has many sections" do
    @menu.sections.should include @apps
    @menu.sections.should include @mains
  end

  it "has menu items from multiple sections" do
    @menu.menu_items.should eq @apps.menu_items + @mains.menu_items
  end
end
