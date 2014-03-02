class MenuItem < ActiveRecord::Base
  has_many :meal_memberships
  has_many :meals, through: :meal_memberships
  belongs_to :section

  def item_percent
  	num = self.meal_memberships.count.to_f
		total = Meal.all.map{|m| m.menu_items.count}.reduce(:+)
  	((num / total)*100).round(1)
  end

  def table_percent
  	num = self.meals.uniq.count.to_f
  	total = self.section.menu.meals.count
  	((num / total)*100).round(1)
  end

  def to_s
    "#{self.name} $#{self.price}"
  end

end
