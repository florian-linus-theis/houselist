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
    it { should have_many(:notifications) }
    it { should have_many(:todos) }
  end
end
