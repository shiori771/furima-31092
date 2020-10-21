class OrderAddress

  include ActiveModel::Model
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number, :token, :purchase_id, :user_id, :item_id

  with_options  presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :block, format: { with: /\A[0-9ぁ-んァ-ン一-龥.-]+\z/}
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "Input only number"}
  end

  validates :prefecture_id, presence: true, numericality: {other_than: 1, message: 'Select'}
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(postcode: postcode, prefecture_id: prefecture_id, city: city, block: block, building: building, phone_number: phone_number, purchase_id: purchase.id)
  end
end