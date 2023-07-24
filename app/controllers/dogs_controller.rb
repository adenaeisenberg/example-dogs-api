class DogsController < ApplicationController
  def create
    @dog = Dog.new(
      name: params["name"],
      user_id: params["user_id"],
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

  def show
    @dog = current_user.dogs.find_by(id: params[:id])
    if authenticate_user
      render :show
    else
      render json: { message: "This is not your dog!" }
    end
  end
end
