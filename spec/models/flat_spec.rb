# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Flat, type: :model do
  context 'with DB columns' do
    {
      address: :string,
      user_id: :integer,
      name: :string
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:belongings) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }
  end
end
