# frozen_string_literal: true

class Notification < ApplicationRecord
  # References
  belongs_to :user
  belongs_to :belonging

  # validations
  validates :description, presence: true
end
