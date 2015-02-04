class ChangeLastVisitedToDate < ActiveRecord::Migration
  def change
    change_column :ratings, :last_visited, :date
  end
end