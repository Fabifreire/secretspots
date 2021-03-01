class CreateSpots < ActiveRecord::Migration[6.1]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :address
      t.string :description
      t.string :category
      t.users :references
      t.timestamps
    end
  end
end
