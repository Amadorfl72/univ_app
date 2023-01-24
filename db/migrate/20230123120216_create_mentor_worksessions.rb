class CreateMentorWorksessions < ActiveRecord::Migration[5.1]
    def change
      drop_table :mentor_courses
      create_table :mentor_worksesssions do |t|
        t.bigint :mentor_id, null: false
        t.bigint :worksession_id, null: false
  
        t.timestamps
      end
      add_foreign_key :mentor_worksesssions, :students, column: :mentor_id
      add_foreign_key :mentor_worksesssions, :courses, column: :worksession_id
      add_index :mentor_worksesssions, [:mentor_id, :worksession_id], unique: true
    end

end
