module Admins
  class CompanyValuesController < AdminController
    def index
      @company_values = CompanyValue.all
    end

    def edit
      company_value
    end

    def show
      company_value
    end

    def new
      @company_value = CompanyValue.new
    end

    def destroy
      company_value
      @company_value.destroy
      redirect_to admins_company_values_path, notice: 'Company value successfully destroyed!'
    end

    def update
      company_value
      if @company_value.update(company_value_params)
        redirect_to admins_company_values_path, notice: 'Company value successfully updated!'
      else
        render :edit
      end
    end

    def create
      @company_value = CompanyValue.new(company_value_params)

      if @company_value.save
        redirect_to admins_company_values_path, notice: 'Company value successfully created!'
      else
        render :new
      end
    end

    private

    def company_value
      @company_value = CompanyValue.find(params[:id])
    end

    def company_value_params
      params.require(:company_value).permit(:title)
    end
  end
end
