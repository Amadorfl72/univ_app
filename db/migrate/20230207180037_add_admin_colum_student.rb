class AddAdminColumStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :admin, :boolean, :default => false
  end
end
