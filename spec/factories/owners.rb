FactoryBot.define do
  factory :owner do
    name                    { Faker::Name.name }
    email                   { Faker::Internet.free_email }
    password                { '1a' + Faker::Internet.password }
    password_confirmation   { password }
  end
end
