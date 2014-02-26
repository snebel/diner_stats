require 'spec_helper'

describe MenuItem do
  before do
    @apps = Section.create(name: 'Appetizers')
    @item = MenuItem.create(name: 'food', price: 10.99)
  end

  it "has a name and price" do
    @item.name.should eq 'food'
    @item.price.should eq 10.99
  end

  it "can be added to the appetizers list" do
    @apps.menu_items << @item
    @item.section.should eq @apps
  end
end
