class Lesson < ApplicationRecord
  mount_uploader :lesson_doc, LessonDocUploader

  validates :title, :content, :lesson_doc, presence: true
end
