class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :shipping_cost, :shipping_prefecture, :shipping_date

  validates :name, :text, :category, :status, :shipping_cost, :shipping_prefecture, :shipping_date, :price, presence: true

  validates :category_id, :status_id, :shipping_cost_id, :shipping_prefecture_id, :shipping_date_id, numericality: { other_than: 1 }
end
