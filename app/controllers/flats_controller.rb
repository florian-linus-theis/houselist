class FlatsController < ApplicationController
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
end
