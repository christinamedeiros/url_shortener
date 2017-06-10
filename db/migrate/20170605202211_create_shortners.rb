class CreateShortners < ActiveRecord::Migration[5.1]
  def change
    create_table :shortners do |t|
      t.string :long_url
      t.string :short_url

      t.timestamps
    end
  end
end
