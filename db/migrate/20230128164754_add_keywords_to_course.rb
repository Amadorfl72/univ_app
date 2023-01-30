class AddKeywordsToCourse < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :keywords, :string
  end
end
