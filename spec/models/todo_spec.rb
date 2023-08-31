# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Todo, type: :model do
  context 'with DB columns' do
    {
      status: :integer,
      description: :text,
      user_id: :integer,
      belonging_id: :integer
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  describe 'associations' do
    it { should belong_to(:belonging) }
    it { should belong_to(:user) }
    it { should have_many(:notifications).dependent(:destroy) }
    it { should have_many_attached(:photos) }
    it { should have_many_attached(:files) }
  end

  describe 'validations' do
    it { should validate_presence_of :description }
    it { should validate_presence_of :status }
    it { should define_enum_for(:status).with_values(%i[active archived]) }
  end
end
