FactoryGirl.define do
  factory :student do
    name 'usamaman'
    picture_file_name (Rails.root + '/spec/fixtures/images/rails.png')
    student_class '2'
    dob '7/11/1999'
    gender '1'
    email 'email@email.com'
    cnic '3234234234234'
    address 'the ultimate address'
    studying_status '1'
    teacher_remarks ''
    parent_name 'somename'
    parent_email 'test@test.com'
    parent_phone '+923234035166'
    parent_cnic '35202-0194587-3'
    parent_password 'password'
    parent_password_confirmation 'password'
    branch_name 'johar town'
    branch_type '1'
    matric_roll_no '123'
    matric_marks '123'
  end
end
