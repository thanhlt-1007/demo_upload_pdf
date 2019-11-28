10.times do
  Lesson.create title: FFaker::Lorem.sentence,
    content: FFaker::Lorem.paragraph,
    lesson_doc: File.open(Rails.root.join("db/assets/pdfs/seed.pdf"))
end
