# frozen_string_literal: true

class Todo < ApplicationRecord
  # References
  belongs_to :belonging
  belongs_to :user
  has_many :notifications, dependent: :destroy
  has_many_attached :photos
  has_many_attached :files

  # validations
  validates :description, presence: true
  validates :status, presence: true
  # validates :photos, presence: true
  # validates belonging_status:, presence: true

  # Modifications
  enum status: %i[active archived]
  enum belonging_status: %i[good damaged needs_replacement]
end
