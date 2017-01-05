FactoryGirl.define do
  factory :user do
  	name "Test User"
  	picture ""
  	email "test@test.com"
  	phone "+923234035166"
  	cnic "35202-0194587-3"
  	role "parent_"
  	password "password"
  	password_confirmation "password"
  end
end
