class PetsittersController < ApplicationController
  before_action :set_petsitter, only: %i[edit update show destroy ]
  # Whitelist les vues pour les users qui ne sont pas enregistrés
  skip_before_action :authenticate_user!, only: %i[index show edit destroy]

  def index
    @petsitters = Petsitter.all
  end

  def show; end

  def new
    @petsitter = Petsitter.new
  end

  def create
    @petsitter = Petsitter.new(petsitter_params)
    @petsitter.user = current_user
    if @petsitter.save
      redirect_to petsitter_path(@petsitter)
    else
      render :new
    end
  end

  def edit; end

  def update
    @petsitter.update(petsitter_params)
    redirect_to dashboard_path
  end

  def destroy
    @petsitter.destroy
    redirect_to dashboard_path
    # => Doit rediriger vers le dashboard
  end

  private

  def set_petsitter
    @petsitter = Petsitter.find(params[:id])
  end

  def petsitter_params
    params.require(:petsitter).permit(:description,
                                      :category,
                                      :location,
                                      :price,
                                      :photo)
  end
end
