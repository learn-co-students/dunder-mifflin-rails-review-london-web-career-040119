class EmployeesController < ApplicationController

  before_action :find_employee, only: [:show, :edit, :update, :destroy]

  def index
    @employees = Employee.all
  end

  def show
    @dog = Dog.find(@employee.dog_id)
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    # byebug
    if @employee.save
      redirect_to employee_path(@employee), :notice => "Your employee has been successfully created!"
    else
      # `.errors.full_messages` returns an array of strings
      flash[:errors] = @employee.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def update
    @employee.update(employee_params)
    redirect_to employees_path
  end

  def destroy
    @employee.destroy
    redirect_to employees_path
  end



  private

  def find_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit!
  end

end
