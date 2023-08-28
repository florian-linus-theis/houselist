class Todo < ApplicationRecord
  belongs_to :belonging
  belongs_to :user
  has_many_attached :photos
  has_many_attached :files
end
