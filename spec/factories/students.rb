FactoryGirl.define do
  factory :student do
    name 'usamaman'
    picture_file_name(Rails.root + '/spec/fixtures/images/rails.png')
    student_class '2'
    dob '7/11/1999'
    gender :male
    email 'email@email.com'
    cnic '3234234234234'
    address 'the ultimate address'
    studying_status :enrolled
    teacher_remarks ''
    association :branch
    matric_roll_no '123'
    matric_marks '123'
    association :parent
  end
end
