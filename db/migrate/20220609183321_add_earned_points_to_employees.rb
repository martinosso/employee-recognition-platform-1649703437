class AddEarnedPointsToEmployees < ActiveRecord::Migration[6.1]
  def change
    add_column :employees, :earned_points, :integer, null: false, default: 0
  end
end
