class MenuItem < ActiveRecord::Base
  has_many :meal_memberships
  has_many :meals, through: :meal_memberships
  belongs_to :section

  def item_percent
  	num = self.meal_memberships.count.to_f
	  total = self.section.menu.meals.inject(0){|n, m| n += m.menu_items.count}
  	((num / total)*100).round(1)
  end

  def meal_percent
  	num = self.meals.uniq.count.to_f
  	total = self.section.menu.meals.count
  	((num / total)*100).round(1)
  end

  def item_revenue
  	self.meal_memberships.count * self.price
  end

  def to_s
    "#{self.name} (#{self.section.name} $#{self.price})"
  end

end
