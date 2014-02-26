require 'spec_helper'

describe MenuItem do
  before do
    @item = build(:menu_item)
  end

  it "has a name and price" do
    @item.name.should eq 'food'
    @item.price.should eq 1.99
  end

  it "can be added to the appetizers list" do
    # @apps.menu_items << @item
    @item.section.name.should eq "Appetizers" # eq @apps
  end
end
