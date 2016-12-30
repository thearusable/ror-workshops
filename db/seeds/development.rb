puts "Seeds-development: start"

User.create!(email: 'admin@admin.com', password: 'adminadmin')

30.times do
  Teacher.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    academic_title: Teacher::TITLES.sample
  )
end

teachers = Teacher.all
20.times do
  SubjectItem.create!(
    title: Faker::Lorem.sentence,
    teacher: teachers.sample
  )
end

40.times do
  Student.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthdate: Faker::Date.between(25.years.ago, 20.years.ago)
  )
end

students = Student.all
chance_of_not_paying = [1,1,1,1,1,1,0]
100.times do
  current = students.sample
  payment = Payment.create!(
      student_id: current.id,
      date_of_payment: Faker::Date.between(12.months.ago, 1.months.ago),
      month: Payment::MONTHS.sample,
      amount: if chance_of_not_paying.sample == 1 then Faker::Number.decimal(2) else nil end
    )
  current.payments << payment
end

SubjectItem.all.each do |subject_item|
  subject_item.students << students.sample(rand(1..4))
end

SubjectItem.all.each do |subject_item|
  subject_item.students.each do |student|
    rand(1..5).times do
      subject_item.subject_item_notes << SubjectItemNote.create(student: student,
                                                                subject_item: subject_item,
                                                                value: rand(1..6))
    end
  end
end

puts "Seeds-development: done"
