class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    # @petsitters = Petsitter.where(email: current_user.email)
    @petsitters = current_user.petsitters
  end
end
