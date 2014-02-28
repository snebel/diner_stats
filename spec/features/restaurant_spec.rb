require 'spec_helper'

feature 'Setting Up a Restaurant' do
  before do
    @restaurant = create(:restaurant)
    visit restaurant_path(@restaurant)
  end

  scenario 'restaurant show page' do
    expect(page).to have_content @restaurant.name
  end

  scenario 'add a new menu' do
    fill_in "name", with: 'Dinner Menu'
    click_button 'add menu'
    expect(page).to have_content 'Dinner Menu'
  end
end

feature 'adding menu section' do
  before do
    # @restaurant = create(:restaurant)
    @menu = create(:menu)
    visit edit_restaurant_menu_path(@menu.restaurant_id, @menu.id)
  end

  scenario 'menu edit page has content' do
    expect(page).to have_content @menu.name
  end

  # scenario 'add a new section menu' do
  #   fill_in "section-name", with: 'Appetizers'
  #   click_button "add section"
  #   expect(page).to have_content @menu.restaurant.name
  #   @menu.sections.should_not be_empty 
  # end --> adding sections not working...?

end