class Item < ApplicationRecord
  has_many_attached :images do |attachable|
    attachable.variant :thumb, resize_to_limit: [ 300, 300 ]
    attachable.variant :normal, resize_to_limit: [ 800, 800 ]
  end

  belongs_to :category
  belongs_to :user

  validates :name, presence: true, length: { minimum: 4 }
  validates :price, presence: true

  scope :search_by_name_or_category, ->(query) {
    if query.present?
      joins(:category).where(
        "items.name LIKE :query OR categories.name LIKE :query",
        query: "%#{query}%"
      )
    else
      all
    end
  }
end
