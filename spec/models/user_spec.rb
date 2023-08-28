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
  end
end
