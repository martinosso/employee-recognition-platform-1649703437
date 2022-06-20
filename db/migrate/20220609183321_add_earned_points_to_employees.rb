class AddEarnedPointsToEmployees < ActiveRecord::Migration[6.1]
  def up
    add_column :employees, :earned_points, :integer, null: false, default: 0
    set_earned_points
  end
  
  def down
    remove_column :employees, :earned_points
  end

  private

  def set_earned_points
    Employee.includes(:received_kudos).all.each do |employee|
      received_kudos = employee.received_kudos.size
      employee.update_attribute(:earned_points, received_kudos * 100) if received_kudos > 0
    end
  end
end
