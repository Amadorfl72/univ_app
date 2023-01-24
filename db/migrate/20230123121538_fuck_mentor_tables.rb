class FuckMentorTables < ActiveRecord::Migration[5.1]
  def change
    drop_table :mentors
    drop_table :mentor_worksessions
  end
end
