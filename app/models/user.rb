class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :first_name, :last_name, :user_name, :age
  validates :age, numericality: {
    greater_than_or_equal_to: 18,
    less_than_or_equal_to: 87
  }
  has_many :cadavers, dependent: :destroy
end
