class OrdersController < ApplicationController
  def create
    reward
    return unless current_employee && current_employee.earned_points >= @reward.price

    @order = Order.new(reward: @reward, employee: current_employee)
    if @order.save
      current_employee.earned_points -= @reward.price
      current_employee.save
      redirect_to rewards_path, notice: "You just bought reward: \"#{@reward.title}\" for #{@reward.price}$"
    else
      redirect_to rewards_path
    end
  end

  private

  def reward
    @reward = Reward.find(params[:reward])
  end
end
