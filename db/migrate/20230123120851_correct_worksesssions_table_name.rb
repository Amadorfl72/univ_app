class CorrectWorksesssionsTableName < ActiveRecord::Migration[5.1]
  def change
    drop_table :mentor_worksesssions
    create_table :mentor_worksessions do |t|
      t.bigint :mentor_id, null: false
      t.bigint :worksession_id, null: false

      t.timestamps
    end
    add_foreign_key :mentor_worksessions, :students, column: :mentor_id
    add_foreign_key :mentor_worksessions, :courses, column: :worksession_id
    add_index :mentor_worksessions, [:mentor_id, :worksession_id], unique: true
  end
end
