FactoryBot.define do

  factory :author do
    first_name { Faker::Name.unique.first_name }
    last_name { Faker::Name.unique.last_name }
  end

  factory :book do
    name { Faker::Book.unique.title }
    authors { [] }
  end
end
