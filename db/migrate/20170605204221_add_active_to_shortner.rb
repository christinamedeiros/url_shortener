class AddActiveToShortner < ActiveRecord::Migration[5.1]
  def change
    add_column :shortners, :active, :boolean
  end
end
