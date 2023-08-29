# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'with DB columns' do
    {
      name: :string
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end
end
