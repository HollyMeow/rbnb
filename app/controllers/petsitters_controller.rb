class PetsittersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_petsitter, only: [:edit, :update, :show, :destroy]

  def index
    @petsitters = Petsitter.all
  end

  def show
  end

  def new
    @petsitter = Petsitter.new
  end

  def create
    @petsitter = Petsitter.new(petsitter_params)
    @petsitter.save
    redirect_to petsitter(@petsitter)
  end

  def edit
  end

  def update
    @petsitter.update(petsitter_params)
  end

  def destroy
    @petsitter.destroy
  end

  private

  def set_petsitter
    @petsitter = Petsitter.find(params[:id])
  end

  def petsitter_params
    params.require(:petsitter).permit(:description, :category, :location, :price)
  end

end
