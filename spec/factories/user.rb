FactoryBot.define do
  factory(:qute) do 
    username { Faker::Internet.username }
    password { Faker::Internet.password }
  end
end
