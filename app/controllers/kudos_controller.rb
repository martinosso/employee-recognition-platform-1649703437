class KudosController < ApplicationController
  before_action :set_kudo, only: %i[show edit update destroy]

  # GET /kudos
  def index
    @kudos = Kudo.all
  end

  # GET /kudos/1
  def show; end

  # GET /kudos/new
  def new
    @kudo = Kudo.new
  end

  # GET /kudos/1/edit
  def edit; end

  # POST /kudos
  def create
    if current_employee and @kudo.giver_id == current_employee.id or current_admin
      @kudo = Kudo.new(kudo_params)
      if current_employee
        @kudo.giver = current_employee
      end

      if @kudo.save
        redirect_to kudos_path, notice: 'Kudo was successfully created.'
      else
        render :new
      end
    else
      redirect_to kudos_url, notice: 'You don\'t have permission to do that!'
    end
  end

  # PATCH/PUT /kudos/1
  def update
    if current_employee and @kudo.giver_id == current_employee.id or current_admin
      if @kudo.update(kudo_params)
        redirect_to @kudo, notice: 'Kudo was successfully updated.'
      else
        render :edit
      end
    else
      redirect_to kudos_path, notice: 'You don\'t have permission to do that!'
    end
  end

  # DELETE /kudos/1
  def destroy
    if current_employee and @kudo.giver_id == current_employee.id or current_admin
      @kudo.destroy
      redirect_to kudos_url, notice: 'Kudo was successfully destroyed.'
    else
      redirect_to kudos_url, notice: 'You don\'t have permission to do that!'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_kudo
    @kudo = Kudo.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def kudo_params
    params.require(:kudo).permit(:title, :content, :giver_id, :receiver_id)
  end
end
