class Item < ApplicationRecord
  belongs_to :category

  validates :name, presence: true, length: { minimum: 10 }
  validates :price, presence: true
end
