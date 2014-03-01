class MenuItem < ActiveRecord::Base
  has_many :meal_memberships
  has_many :meals, through: :meal_memberships
  belongs_to :section

  def to_s
    "#{self.name} $#{self.price}"
  end

end
