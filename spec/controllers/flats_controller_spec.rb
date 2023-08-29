require 'rails_helper'

RSpec.describe FlatsController, type: :controller do
  describe "#index" do
    login_user

    let(:flats) { create(:flat, 3) }

    it "responds successfully" do
      get :index
      expect(response).to be_successful
    end
  end
end
