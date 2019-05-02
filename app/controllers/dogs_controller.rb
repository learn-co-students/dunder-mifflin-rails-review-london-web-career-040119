class DogsController < ApplicationController

  def index
    @dogs = Dog.all
  end

  def show
    @dog = Dog.find(params[:id])
    @employees = Employee.select { |employee| employee.dog_id == @dog.id}
    # byebug
  end


end
