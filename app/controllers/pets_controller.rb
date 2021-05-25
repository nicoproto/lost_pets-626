class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :edit, :destroy]

  def index
    # Array with all the pets
    @pets = Pet.all
  end

  def show
    # Nothing is here because of the before_action on the top
  end

  def new
    # Need the empty instance so simple_form_for can build the form
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)
    @pet.save

    redirect_to pet_path(@pet)
  end

  def edit
    # Nothing is here because of the before_action on the top
  end

  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end

  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :species, :address, :found_on)
  end
end
