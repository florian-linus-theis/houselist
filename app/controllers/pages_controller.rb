# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # If the user is signed in, he/she will always be forwarded to flats page
    if user_signed_in?
      redirect_to flats_path
    else
      redirect_to new_user_session_path
    end
  end

  def profile
    @user = current_user
  end
end
