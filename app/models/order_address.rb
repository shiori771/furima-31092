class OrderAddress
  include ActiveModel::ActiveModel
  attr_accessor :postcode, :prefecture_id, :city, :block, :building, :phone_number

  with options  presence: true do
    validates :postcode, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "Input correctly"}
    validates :city, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :block, format: { with: /\A[0-9ぁ-んァ-ン一-龥]+\z/}
    validates :phone_number, format: { with: /\A\d{11}\z/, message: "Input only number"}
  end

  validates :prefecture_id, presence: true, numericality: {other_than: 1, message: 'Select'}
  
  def save
  end
end