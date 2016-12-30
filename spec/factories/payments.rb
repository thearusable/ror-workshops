FactoryGirl.define do
  factory :payment do
    student_id { Student.first.id }
    date_of_payment { '1992/02/14' }
    month { 'January' }
  end
end
