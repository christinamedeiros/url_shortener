class AddUserIdColumnToShortners < ActiveRecord::Migration[5.1]
  def change
    add_column :shortners, :user_id, :integer
  end
end
