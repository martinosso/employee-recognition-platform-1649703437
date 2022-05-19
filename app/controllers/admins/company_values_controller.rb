module Admins
  class CompanyValuesController < AdminController
    before_action :set_companyvalue, only: %i[destroy show edit update]

    def index
      @companyvalues = CompanyValue.all
    end

    def edit; end

    def show; end

    def new
      @companyvalue = CompanyValue.new
    end

    def destroy
      @companyvalue.destroy
      redirect_to admins_company_values_path, notice: 'Company value successfully destroyed!'
    end


    def update
      if @companyvalue.update(companyvalue_params)
        redirect_to admins_company_values_path, notice: 'Company value successfully updated!'
      else
        render :edit
      end
    end

    def create
      @companyvalue = CompanyValue.new(companyvalue_params)

      if @companyvalue.save
        redirect_to admins_company_values_path, notice: 'Company value successfully created!'
      else
        render :new
      end
    end


    private
      def set_companyvalue
        @companyvalue = CompanyValue.find(params[:id])
      end

      def companyvalue_params
        params.require(:company_value).permit(:title)
      end
  end
end
