class Cadaver < ApplicationRecord
  belongs_to :user

  validates_presence_of :fresh, :healthy, :age, :whole, :first_name
  validates :age, numericality: {
    greater_than_or_equal_to: 21,
    less_than_or_equal_to: 80
  }
end
