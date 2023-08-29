# frozen_string_literal: true

class FlatsController < ApplicationController
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  def index
    @flats = policy_scope(Flat)
    binding.pry
  end
end
