class AddMentorIdToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :mentor_id, :integer
  end
  add_foreign_key :courses, :students, column: :student_id
end
