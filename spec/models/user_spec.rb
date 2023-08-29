# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  context 'with DB columns' do
    {
      first_name: :string,
      last_name: :string,
      email: :string,
      encrypted_password: :string,
      type: :integer
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  describe 'associations' do
    it { should have_many(:flats) }
    it { should have_many(:notifications) }
    it { should have_many(:todos) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end
end
