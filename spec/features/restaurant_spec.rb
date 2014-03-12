require 'spec_helper'

feature 'Setting Up a Restaurant' do
  before do
    @restaurant = create(:restaurant, id: 1)
    @menu = create(:menu, restaurant_id: @restaurant.id)
    @section = create(:section, menu_id: @menu.id)
  end

  scenario 'add a new menu section' do
    visit edit_restaurant_menu_path(@restaurant.id, @menu.id)
    fill_in "name", with: 'Apps'
    click_button 'add section'
    current_path.should == edit_restaurant_menu_path(@restaurant.id, @menu.id)
    visit edit_restaurant_menu_path(@restaurant.id, @menu.id)
  end

  scenario 'add a new menu item' do
    visit edit_menu_section_path(@menu, @section)
    fill_in "name", with: 'Salad'
    fill_in "price", with: '5'
    page.should have_content('add item')
  end

  scenario 'restaurant show page' do
    visit restaurant_path(@restaurant)
    expect(page).to have_content
  end
end
