require 'spec_helper'

describe Table do
  before do
    @table = create(:table)
    @meal1 = create(:meal, table_id: @table.id)
    @meal2 = create(:meal, table_id: @table.id)
  end

  it "has many meals" do
    @table.meals.should include @meal1
    @table.meals.should include @meal2
  end
end
