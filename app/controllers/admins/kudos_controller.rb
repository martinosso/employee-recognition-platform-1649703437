module Admins
  class KudosController < AdminController
    before_action :kudo, only: %i[show destroy]

    def index
      @kudos = Kudo.all
    end

    def show; end

    def destroy
      @kudo.destroy
      redirect_to admins_kudos_url, notice: 'Kudo was successfully destroyed.'
    end

    private

    def kudo
      @kudo = Kudo.find(params[:id])
    end
  end
end
