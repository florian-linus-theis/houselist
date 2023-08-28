require 'rails_helper'

RSpec.describe Belonging, type: :model do
  context 'with DB columns' do
    {
      status: :int,
      description: :string,
      user_id: :integer,
      belonging_id: :integer
    }.each do |attribute, type|
      it { is_expected.to have_db_column(attribute).of_type type }
    end
  end

  describe 'associations' do
    it { should belong_to(:belonging) }
    it { should belong_to(:user) }
  end
end
