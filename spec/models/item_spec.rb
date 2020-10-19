require 'rails_helper'
RSpec.describe Item, type: :model do
  
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '出品商品の保存' do
    context "商品が保存できる場合" do
      it "image,name, text, category_id, status_id, shipping_cost_id, shipping_prefecture_id, shipping_date_id, price, userが全て存在すれば出品できること " do
        expect(@item).to be_valid
      end

    end
    context "商品が保存できない場合" do
      it "imageが空だと保存できないこと" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it "nameが空だと保存できないこと" do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      
      it "textが空だと保存できないこと" do
        @item.text = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      
      it "category_idが1だと保存できないこと" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category Select")
      end
      
      it "status_idが1だと保存できないこと" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Status Select")
      end
      
      it "shipping_cost_idが1だと保存できないこと" do
        @item.shipping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping cost Select")
        end
        
      it "shipping_prefecture_idが1だと保存できないこと" do
        @item.shipping_prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping prefecture Select")
      end
      
      it "shipping_date_idが1だと保存できないこと" do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date Select")
      end
      
      it "priceが空だと保存できないこと" do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank","Price Out of setting range", "Price Half-width number")
      end

      it "priceが300未満だと保存できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      
      it "priceが9,999,999より大きいと保存できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Out of setting range")
      end
      
      it "priceが半角英数じゃない場合（全角カタカナ）保存できないこと" do
        @item.price = "テスト"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number", "Price Out of setting range")
      end

      it "priceが半角英数じゃない場合（全角ひらがな）保存できないこと" do
        @item.price = "てすと"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price Half-width number", "Price Out of setting range")
      end

      
      it "userが紐づいていないと保存できないこと" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
