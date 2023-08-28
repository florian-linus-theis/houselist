class Belonging < ApplicationRecord
  belongs_to :flat
  belongs_to :category
  has_many :notifications, dependent: :destroy
  has_many :todos, dependent: :destroy
  has_many_attached :photos
  has_many_attached :files
end
