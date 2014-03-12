require 'spec_helper'


feature 'managing a table' do
	before do
		@restaurant = create(:restaurant, id: 1)
    @menu = create(:menu, restaurant_id: @restaurant.id)
    @section = create(:section, menu_id: @menu.id)
    @item = create(:menu_item, section_id: @section.id)
		@table = create(:table, restaurant_id: @restaurant.id)
		visit restaurant_path(@restaurant)
	end

	scenario 'restaurant has a page for managing tables' do
		page.should have_content @table.number
	end

	scenario 'can click a link to seat diners' do
		find('.table-div').find('.dropdown-menu').find('a', text: 4).click
		page.should have_content 'Add Items'
		page.should have_content 'End Meal'
	end

	scenario 'can update price by adding a menu item' do
		find('.checkbox').should have_content(@item.name)
	end
end