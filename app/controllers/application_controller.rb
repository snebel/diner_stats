class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  
  def avg_duration(meals)
    return 0 if meals.empty?
  	total_minutes = meals.map{|meal| meal.duration / 60.0}.reduce(:+)
  	(total_minutes.to_f / meals.count).round(1)
  end

  def revenue(meals)
    return 0 if meals.empty?
  	meals.inject(0) {|sum, meal| sum += meal.price}.round(2)
  end

  def avg_price(meals)
    return 0 if meals.count == 0
  	(revenue(meals) / meals.count).round(2)
  end	

  def total_diners(meals)
    return 0 if meals.empty?
  	meals.inject(0){|sum, meal| sum += meal.diners}
  end

  def avg_customer_price(meals)
    return 0 if meals.count == 0
  	(revenue(meals) / total_diners(meals)).round(2)
  end

  def set_positions(table_data)
    table_data.each do |data|
      # data has form [id, left, top]
      Table.find(data[0]).update(left: data[1], top: data[2])
    end
  end

  def item_revenue_data(meals, revenue)
    items = meals.map{|meal| meal.menu_items}.flatten
    items.uniq.map do |item|
      freq = items.count(item) * item.price / revenue
      {letter: "#{item.name[0..3]}.", frequency: freq}
    end
  end

  def section_revenue(section_id, meals)
    items = meals.map{|meal| meal.menu_items}.flatten
    items.select!{|item| item.section_id == section_id}
    items.inject(0){|sum, item| sum += item.price}
  end

  def sections_revenue_data(meals, sections)
    sections.map do |section|
      section_rev = section_revenue(section.id, meals)
      rev_share = (section_rev / revenue(meals)).round(2)
      {letter: section.name, frequency: rev_share}
    end
  end

  def table_revenue(table_id, meals)
    table_meals = meals.select{|meal| meal.table_id == table_id}
    table_meals.inject(0){|sum, meal| sum += meal.price}
  end

  def table_revenue_data(meals, tables)
    tables.map do |table|
      table_rev = table_revenue(table.id, meals)
      rev_share = (table_rev / revenue(meals)).round(2)
      {letter: table.number, frequency: rev_share}
    end
  end

  def meals_by_time(meals, time1, time2)
    if time1 == nil || time1 == ''
      meals.sort_by(&:created_at)
    else
      meals.select do |meal|
        meal_date = meal.created_at.to_date
        meal_date >= time1.to_date && meal_date <= time2.to_date
      end.sort_by(&:created_at)
    end
  end

  def validate_times(params)
    if params[:time1] && params[:time1].to_date > params[:time2].to_date
      params[:time1] = nil
      params[:time2] = nil
      flash[:notice] = "From-date can't be later than to-date"
    else
      flash[:notice] = ''
    end
  end

end
