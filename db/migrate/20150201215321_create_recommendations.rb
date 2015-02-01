class CreateRecommendations < ActiveRecord::Migration
  def change
    create_table :recommendations do |t|
      t.date :date
      t.references :restaurant, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
