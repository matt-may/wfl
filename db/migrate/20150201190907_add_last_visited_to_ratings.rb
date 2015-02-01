class AddLastVisitedToRatings < ActiveRecord::Migration
  def change
    add_column :ratings, :last_visited, :datetime
  end
end
