class DogsController < ApplicationController
  def create
    @dog = Dog.new(
      name: params["name"],
      age: params["age"],
      breed: params["breed"],
      owner: params["owner"],
    )
    if current_user
      @dog.save
      render :show
    else
      render json: { message: "Dog not created. User must be signed in to create dog." }
    end
  end

  def index
    @dogs = Dog.all
    render :index
  end
end
