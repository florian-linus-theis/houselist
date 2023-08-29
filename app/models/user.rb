# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # References
  has_one_attached :photo
  has_many :flats, dependent: :destroy
  has_many :belongings, through: :flats
  has_many :notifications, dependent: :destroy
  has_many :tenants, dependent: :destroy
  has_many :todos, dependent: :destroy

  # Validations
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :role, presence: true

  # Modifications
  enum role: %i[landlord tenant]
end
