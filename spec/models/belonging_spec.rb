# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Belonging, type: :model do
  context 'with DB columns' do
    {
      name: :string,
      status: :integer,
      description: :text,
      flat_id: :integer,
      category_id: :integer
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  describe 'associations' do
    it { should belong_to(:flat) }
    it { should belong_to(:category) }
    it { should have_many(:notifications).dependent(:destroy) }
    it { should have_many(:todos).dependent(:destroy) }
    it { should have_many_attached(:photos) }
    it { should have_many_attached(:files) }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :status }
    it { should validate_presence_of :description }
    it { should define_enum_for(:status).with_values(%i[good damaged needs_replacement]) }
  end
end
