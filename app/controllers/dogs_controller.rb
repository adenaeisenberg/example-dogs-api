class DogsController < ApplicationController
  def create
    @dog = Dog.new(
      name: params["name"],
      age: params["age"],
      breed: params["breed"],
      owner: params["owner"],
    )
    if @user && @user.authenticate(params[:password])
      @dog.save
    else
      render json: { message: "Dog not created. User must be signed in to create dog." }
    end
  end
end
