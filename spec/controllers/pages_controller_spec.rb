require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  describe "GET root" do
    it "responds successfully" do
      get :home

      expect(response).to be_successful
    end

    it "redirects to flat path if user signed in" do
      sign_in user

      get :home

      expect(response).to redirect_to flats_path
    end
  end
end
