class AddMentorDataToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :is_mentor, :boolean
    add_column :students, :role, :string
    add_column :students, :domain, :string
    add_column :students, :team, :string
    add_column :students, :skills, :text
  end
end
