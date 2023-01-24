class CreateMentorCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :mentor_courses do |t|
      t.bigint :mentor_id, null: false
      t.bigint :course_id, null: false

      t.timestamps
    end
    add_foreign_key :mentor_courses, :students, column: :mentor_id
    add_foreign_key :mentor_courses, :courses, column: :course_id
    add_index :mentor_courses, [:mentor_id, :course_id], unique: true
  end
end
