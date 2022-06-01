module Admins
  class RewardsController < AdminController

    def index
      @rewards = Reward.all
    end

    def show
      redirect_to admins_rewards_path
    end

    def new
      @reward = Reward.new
    end

    def edit
      reward
    end

    def update
      reward
      if @reward.update(reward_params)
        redirect_to admins_rewards_path, notice: 'Reward successfully updated!'
      else
        render :edit
      end
    end

    def destroy
      reward
      @reward.destroy
      redirect_to admins_rewards_path, notice: 'Reward successfully destroyed!'
    end

    def create
      @reward = Reward.new(reward_params)
      if @reward.save
        redirect_to admins_rewards_path, notice: 'Reward successfully created!'
      else
        render :new
      end
    end

    private

    def reward
      @reward = Reward.find(params[:id])
    end

    def reward_params
      params.require(:reward).permit(:title, :description, :price).merge(price: Money.from_amount(params.require(:reward)[:price].to_f))
    end
  end
end
