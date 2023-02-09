class AddConfirmationTokenToStudents < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :confirmation_token, :string
  end
end
