FactoryBot.define do

  factory :author do
    first_name { 'Leo' }
    last_name { 'Tolstoy' }
  end

  factory :book do
    name { 'War and Peace' }
  end
end
