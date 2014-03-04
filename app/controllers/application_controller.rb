class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def avg_duration(meals)
  	total_minutes = meals.map{|meal| meal.duration / 60.0}.reduce(:+)
  	(total_minutes.to_f / meals.count).round(1)
  end

  def revenue(meals)
  	meals.inject(0) {|sum, meal| sum += meal.price}.round(2)
  end

  def avg_price(meals)
  	(revenue(meals) / meals.count).round(2)
  end	

  def total_diners(meals)
    return 0 if meals.empty?
  	meals.map{|meal| meal.diners}.reduce(:+)
  end

  def avg_customer_price(meals)
  	(revenue(meals) / total_diners(meals)).round(2)
  end

  def set_positions(table_data)
    table_data.each do |data|
      # data has form [id, left, top]
      Table.find(data[0]).update(left: data[1], top: data[2])
    end
  end

  def item_revenue_data(items, revenue)
    items.map do |item|
      num = item.meal_memberships.count
      freq = num * item.price / revenue
      {letter: item.name[0..2], frequency: freq}
    end
  end

  def section_rev(section)
    section.menu_items.inject(0) do |sum, item|
      sum += (item.meal_memberships.count * item.price)
    end
  end

  def section_revenue_data(sections, revenue)
    sections.map do |section|
      total_rev = section_rev(section)
      rev_share = (total_rev / revenue).round(2)
      {letter: section.name, frequency: rev_share}
    end
  end

  def table_rev(table)
    table.meals.inject(0) {|sum, meal| sum += meal.price}
  end

  def table_revenue_data(tables, revenue)
    tables.map do |table|
      total_rev = table_rev(table)
      rev_share = (total_rev / revenue).round(2)
      {letter: table.number, frequency: rev_share}
    end
  end

end
