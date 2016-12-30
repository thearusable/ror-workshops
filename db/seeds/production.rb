puts "Seeds-production: start"

FIRST_NAMES_MALE = %w(Alex Jacob Kevin Liam Ryan Michael Adam Robert John Luke)
FIRST_NAMES_FEMALE = %w(Emma Olivia Sarah Lily Sophia Mia Lucy Rachel Bella Alice)
LAST_NAMES = %w(Smith Johnson Williams Brown Davis Miller Wilson Taylor Jackson Thompson Martinez Clark Lewis Walker House)

User.create!(email: 'admin@admin.com', password: 'adminadmin')

3.times do
  sex = rand(0..1)
  Teacher.create!(
    first_name: if sex == 0 then FIRST_NAMES_MALE.sample else FIRST_NAMES_FEMALE.sample end,
    last_name: LAST_NAMES.sample,
    academic_title: Teacher::TITLES.sample
  )
end

teachers = Teacher.all
SubjectItem.create!(title: "When More Is Never Enough.", teacher: teachers.sample)
SubjectItem.create!(title: "How to Say No?", teacher: teachers.sample)
SubjectItem.create!(title: "How to learn programming fast?", teacher: teachers.sample)
SubjectItem.create!(title: "Is it worth to learn programming? and why yes!", teacher: teachers.sample)
SubjectItem.create!(title: "How Much Is Too Much?", teacher: teachers.sample)


from = 25.years.ago.to_date
to = 20.years.ago.to_date

25.times do
  sex = rand(0..1)
  Student.create!(
    first_name: if sex == 0 then FIRST_NAMES_MALE.sample else FIRST_NAMES_FEMALE.sample end,
    last_name: LAST_NAMES.sample,
    birthdate: rand(from..to)
  )
end

students = Student.all
chance_of_not_paying = [1,1,1,1,1,1,0]

Student.all.count.times do |s|
  12.times do |m|
    current = Student.find(s+1)
    payment = Payment.create!(
        student_id: current.id,
        date_of_payment: "2016/" + Payment::MONTHS.at(m).to_s + "/" + rand(1..28).to_s,
        month: Payment::MONTHS.at(m),
        amount: if chance_of_not_paying.sample == 1 then (rand * (1000-300) + 300).round(2) else nil end
      )
    current.payments << payment
  end
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

puts "Seeds-production: done"
