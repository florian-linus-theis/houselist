# frozen_string_literal: true

class Tenant < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  validates_uniqueness_of :flat, scope: :user
end
