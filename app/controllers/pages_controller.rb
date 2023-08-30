# frozen_string_literal: true

class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home

  def home
    # If the user is signed in, he/she will always be forwarded to flats page
    redirect_to flats_path if user_signed_in?
  end
end
