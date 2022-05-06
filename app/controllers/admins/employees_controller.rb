module Admins
  class EmployeesController < AdminController
    before_action :set_employee, only: %i[destroy edit update]

    def index
      @employees = Employee.all
    end

    def edit; end

    def destroy
      @employee.destroy
      redirect_to admins_employees_url, notice: 'Employee successfully destroyed.'
    end

    def update
      if @employee.update(employee_params)
        redirect_to admins_employees_path, notice: 'Employee successfully updated.'
      else
        render :edit, notice: 'test'
      end
    end

    private

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
      if params.require(:employee)[:password].blank?
        params.require(:employee).permit(:email, :number_of_available_kudos)
      else
        params.require(:employee).permit(:email, :number_of_available_kudos, :password)
      end
    end
  end
end
  