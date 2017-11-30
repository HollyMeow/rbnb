class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
  end

  def dashboard
    @petsitters = current_user.petsitters
    @bookings = current_user.bookings
  end
end
