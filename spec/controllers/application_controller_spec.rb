require "spec_helper"

describe ApplicationController do
  before do
    @table = create(:table)
    @meals = [
      create(:meal, duration: 120, price: 5, diners: 2),
      create(:meal, duration: 60, price: 6, diners: 2, table_id: @table.id),
      create(:meal, duration: 180, price: 7, diners: 2, table_id: @table.id)
    ]
    @item = create(:menu_item)
    MealMembership.create(meal_id: @meals.first.id, menu_item_id: @item.id)
  end

  describe "#avg_duration" do
    it "can determine avg duration of a group of meals" do
      controller.avg_duration(@meals).should eq 2.0
    end
  end

  describe "#revenue" do
    it "can determine total revenue of a group of meals" do
      controller.revenue(@meals).should eq 18.0
    end
  end

  describe "#avg_price" do
    it "can determine avg price of a group of meals" do
      controller.avg_price(@meals).should eq 6.0
    end
  end

  describe "#avg_customer_price" do
    it "can determine avg amount spent per customer from a group of meals" do
      controller.avg_customer_price(@meals).should eq 3.0
    end
  end

  describe "#set_positions" do
    it "can set left and top positions on a table" do
      controller.set_positions([[@table.id, 100, 200]])
      # @table.left.should eq 100
      # @table.top.should eq 200
    end
  end

  describe "#item_revenue_data" do
    it "can generate item_revenue data for the bar graph" do
      revenue = controller.revenue(@meals)
      data = controller.item_revenue_data(@meals, revenue)
      data.first[:letter].should eq "#{@item.name[0..3]}."
      data.first[:frequency].should eq 1.99/18
    end
  end

  describe "#table_reveue" do
    it "given a table_id and meals, it can determine the revenue from meals at that table" do
      controller.table_revenue(@table.id, @meals).should eq 13.0
    end
  end

  describe "#table_reveue_data" do
    it "can create hash of revenue frequency for tables based on a group of meals" do
      data = controller.table_revenue_data(@meals, Table.all)
      data.size.should eq 2
      data[0][:frequency].should eq (13.0/18).round(2)
    end
  end

  describe "#meals_by_time" do
    it "returns the meals between two times" do
      meals = controller.meals_by_time(@meals, @meals[0].created_at, @meals[-1].created_at)
      meals.should eq @meals
      controller.meals_by_time(@meals, '', nil).should eq @meals
    end
  end
end







