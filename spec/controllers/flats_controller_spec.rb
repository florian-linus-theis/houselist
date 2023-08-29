require 'rails_helper'

RSpec.describe FlatsController, type: :controller do
  before :each do
    sign_in FactoryBot.create(:user)
    FactoryBot.create(:flat)
  end

  describe "GET #index" do
    it "responds successfully" do
      get :index

      expect(response).to be_successful
    end
  end
end
