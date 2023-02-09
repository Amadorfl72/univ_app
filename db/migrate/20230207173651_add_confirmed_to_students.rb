class AddConfirmedToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :confirmed, :boolean, :default => false
  end
end
