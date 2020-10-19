class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image
  
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping_cost
  belongs_to_active_hash :shipping_prefecture
  belongs_to_active_hash :shipping_date
  
  
  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true

  validates :price,  presence: true, format: { with: /\A[0-9]{3,7}+\z/, message: 'Half-width number' }

  validates :price, presence: true, numericality: { only_integer: true,  greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: 'Out of setting range' }
  
  validates :category_id,  presence: true
  validates :status_id, presence: true
  validates :shipping_cost_id, presence: true
  validates :shipping_prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  
  
  validates :category_id, numericality: { other_than: 1, message: 'Select' }
  validates :status_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_cost_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_prefecture_id, numericality: { other_than: 1, message: 'Select' }
  validates :shipping_date_id, numericality: { other_than: 1, message: 'Select' }

end
