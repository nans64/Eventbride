FactoryBot.define do
  factory :event do
    start_date { "2019-02-11 15:15:43" }
    duration { 1 }
    title { "MyString" }
    description { "MyText" }
    price { 1 }
    location { "MyString" }
  end
end

