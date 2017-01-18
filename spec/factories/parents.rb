FactoryGirl.define do
  factory :parent do
    name 'Test User'
    email 'test@test.com'
    phone '+923234035166'
    cnic '35202-0194587-3'
    password 'password'
    password_confirmation 'password'
  end
end
