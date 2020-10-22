class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one :purchase
  has_one_attached :image

  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_prefecture
  belongs_to_active_hash :shipping_date

  with_options presence: true do
    validates :image
    validates :name
    validates :text
  end

  with_options presence: true, numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :shipping_cost_id
    validates :shipping_prefecture_id
    validates :shipping_date_id
  end

  validates :price,
            presence: true,
            format: { with: /\A[0-9]{3,7}+\z/, message: 'Half-width number' },
            numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
end
