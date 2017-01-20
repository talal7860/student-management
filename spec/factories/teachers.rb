FactoryGirl.define do
  factory :teacher do
    name 'Test User'
    picture_file_name (Rails.root + '/spec/fixtures/images/rails.png')
    email 'test@test.com'
    phone '+923234035166'
    cnic '3520201945873'
    password 'password'
    password_confirmation 'password'
  end
end
