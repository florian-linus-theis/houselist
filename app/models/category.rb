# frozen_string_literal: true

class Category < ApplicationRecord
  # References
  has_many :belongings

  # validations
  validates :name, presence: true
end
