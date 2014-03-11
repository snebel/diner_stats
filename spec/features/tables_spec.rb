require 'spec_helper'
 # Capybara.current_driver = :selenium

feature 'managing a table' do
	before do
		@table = create(:table)
		visit restaurant_path(@table.restaurant.id)
	end

	scenario 'restaurant has a page for managing tables' do
		page.should have_content @table.restaurant.name
	end

	scenario 'can create a meal with number of diners' do
		num = Meal.count
		select('3')
		click_button 'seat'
		# @table.meals.should_not be_empty # why isn't this working?		
	end

	scenario 'can update price by adding a menu item' do
		click_button 'seat'
		click_button 'add item'
	end
end