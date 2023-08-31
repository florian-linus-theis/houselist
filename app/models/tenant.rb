# frozen_string_literal: true

class Tenant < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates_uniqueness_of :flat_id, scope: :user_id
end
