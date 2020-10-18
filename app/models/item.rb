class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :shipping_cost, :shipping_prefecture, :shipping_date

  validates :name, :text, :category, :status, :shipping_cost, :shipping_prefecture, :shipping_date, :price, presence: true

  validates :category_id, :status_id, :shipping_cost_id, :shipping_prefecture_id, :shipping_date_id, numericality: { other_than: 1 }

  VALID_PRICE_REGEX = /\A[0-9]+\z/
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, only_integer: true }, format: { with: VALID_PRICE_REGEX }
end
