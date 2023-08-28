require 'rails_helper'

RSpec.describe Flat, type: :model do
  context 'with DB columns' do
    {
      address: :name
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end
end
