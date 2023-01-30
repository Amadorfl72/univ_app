class AddInterestToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :interests, :string
  end
end
