require 'spec_helper'

describe Table do
  before do
    @table = create(:table)
    @meal1 = create(:meal, table_id: @table.id, price: 5.5, diners: 3, duration: 600)
    @meal2 = create(:meal, table_id: @table.id, price: 5.5, diners: 4, duration: 1200)
  end

  it "has many meals" do
    @table.meals.should include @meal1
    @table.meals.should include @meal2
  end

  it "belongs to a restaurant" do
    @table.restaurant.should be_valid
  end

  it "can determine the price of all its meals" do
    @table.total_price.should eq 11.0
  end

  it "can determine the total number of diners that have sat at the table" do
    @table.total_diners.should eq 7
  end

  it "it can determine the average price of its meals" do
    @table.avg_price.should eq (11.0/2).round(2)
  end

  it "can determine the average amount a customer has paid" do
    @table.avg_customer_price.should eq (11.0/7).round(2)
  end

  it "can determine the average duration of its meals" do  
    @table.avg_meal_time.should eq 15.0
  end

  it "can determine the average number of diners at its meals" do  
    @table.avg_seats.should eq 3.5.round(2)
  end

end
