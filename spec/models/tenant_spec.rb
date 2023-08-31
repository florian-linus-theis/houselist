# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tenant, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:flat) { FactoryBot.create(:flat) }

  context 'with DB columns' do
    {
      user_id: :integer,
      flat_id: :integer
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:flat) }
  end

  describe 'validations' do
    context "it should allow a user to be assigned to a flat only once" do
      subject { FactoryBot.create(:tenant, user:, flat:) }

      it { should validate_uniqueness_of(:flat_id).scoped_to(:user_id) }
    end
  end
end
