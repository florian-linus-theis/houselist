# frozen_string_literal: true

class Belonging < ApplicationRecord
  # References
  belongs_to :flat
  belongs_to :category
  has_many :notifications, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many_attached :photos
  has_many_attached :files

  # validations
  validates :name, presence: true
  validates :status, presence: true
  validates :description, presence: true

  # modfications
  enum status: %i[good damaged needs_replacement]

  # PgSearch
  include PgSearch::Model
  pg_search_scope :query_belonging,
                  against: %i[name description status],
                  associated_against: {
                    category: %i[name]
                  },
                  using: { tsearch: { prefix: true } }
end
