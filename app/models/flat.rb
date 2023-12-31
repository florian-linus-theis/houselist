# frozen_string_literal: true

class Flat < ApplicationRecord
  # References
  belongs_to :user
  has_many :belongings, dependent: :destroy
  has_many :tenants, dependent: :destroy
  has_many :notifications, through: :belongings
  has_many :todos, through: :belongings
  has_many_attached :photos

  # Validations
  validates :address, presence: true
  validates :name, presence: true
  validates :photos, presence: true
end
