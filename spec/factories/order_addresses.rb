FactoryBot.define do
  factory :order_address do
    postcode { '123-4567' }
    prefecture_id { 3 }
    city { '横浜市緑区' }
    block { '青山4-1' }
    building { '新緑ビル205' }
    phone_number { 12345678901 } 
  end
end
