class Flat < ApplicationRecord
  belongs_to :user
  has_many :belongings, dependent: :destroy
  has_many :tenants, dependent: :destroy
  has_many_attached :photos
end
