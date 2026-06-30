class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  validates :name, presence: true
  validates :age, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
