require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入に関する情報を保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end
    it "全ての値が正しく入力されていれば保存できること" do
      expect(@order_address).to be_valid
    end

    it "buildingが空でも保存できること" do
      @order_address.building = nil
      expect(@order_address).to be_valid
    end

    it "tokenが空だと保存できないこと" do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it "postcodeが空だと保存できないこと" do
      @order_address.postcode = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode can't be blank", "Postcode Input correctly")
    end

    it "postcodeにハイフンが含まれないと保存できないこと" do
      @order_address.postcode = 12345678
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postcode Input correctly")
    end
    
    it "prefecture_idが空だと保存できないこと" do
      @order_address.prefecture_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture Select", "Prefecture can't be blank")
    end
    
    it "cityが空だと保存できないこと" do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank", "City is invalid")
    end
    
    it "blockが空だと保存できないこと" do
      @order_address.block = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Block can't be blank", "Block is invalid")
    end
    
    it "phone_numberが空だと保存できないこと" do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank", "Phone number Input only number")
    end

    it "phone_numberにハイフンが含まれていると保存できないこと" do
      @order_address.phone_number = "123-4567-8901"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input only number")
    end
    
    it "phone_numberは11桁を超えると保存できないこと" do
      @order_address.phone_number = 123456789012
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number Input only number")
    end
  end
end
