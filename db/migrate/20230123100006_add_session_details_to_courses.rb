class AddSessionDetailsToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :max_attendants, :integer
    add_column :courses, :session_date, :datetime 
  end
end
