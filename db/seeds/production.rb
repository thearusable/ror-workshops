puts "Seeds-production: start"

TEACHER_TITLES = %w(Dr. Prof. TA)
FIRST_NAMES_MALE = %w(Alex Jacob Kevin Liam Ryan Michael Adam Robert John Luke)
FIRST_NAMES_FEMALE = %w(Emma Olivia Sarah Lily Sophia Mia Lucy Rachel Bella Alice)
LAST_NAMES = %w(Smith Johnson Williams Brown Davis Miller Wilson Taylor Jackson Thompson Martinez Clark Lewis Walker House)

User.create(email: 'admin@admin.com', password: 'adminadmin')

3.times do
  sex = rand(0..1)
  Teacher.create!(
    first_name: if sex == 0 then FIRST_NAMES_MALE.sample else FIRST_NAMES_FEMALE.sample end,
    last_name: LAST_NAMES.sample,
    academic_title: TEACHER_TITLES.sample
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
