class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  
  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999,  only_integer: true }, format: { with: /\A[0-9]+\z/ }
  
  validates :category_id,  presence: true
  validates :status_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :shipping_prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  
  
  validates :category_id, numericality: { other_than: 1 }
  validates :status_id, numericality: { other_than: 1 }
  validates :shipping_cost_id, numericality: { other_than: 1 }
  validates :shipping_prefecture_id, numericality: { other_than: 1 }
  validates :shipping_date_id, numericality: { other_than: 1 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category, :status, :shipping_cost, :shipping_prefecture, :shipping_date
  
end
