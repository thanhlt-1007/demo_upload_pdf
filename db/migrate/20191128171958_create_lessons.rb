class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :content
      t.string :lesson_doc

      t.timestamps
    end
  end
end
