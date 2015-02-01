class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.integer :rate
      t.references :user, index: true
      t.references :restaurant, index: true

      t.timestamps
    end
  end
end
