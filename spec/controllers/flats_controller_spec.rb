require 'rails_helper'

RSpec.describe FlatsController, type: :controller do
  let(:user) { FactoryBot.create(:user) }
  let(:flat) { FactoryBot.create(:flat) }

  before :each do
    sign_in user
  end

  describe "GET #index" do
    it "responds successfully" do
      get :index

      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "responds successfully" do
      get :show, params: { id: flat.id }

      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "responds successfully" do
      get :new

      expect(response).to be_successful
    end

    xit "generates a pundit error if user is not landlord" do
      user.update(role: 'tenant')
      get :new

      expect(response).to redirect_to root_path
    end
  end

  describe "POST #create" do
    it "responds successfully with redirect" do
      post :create, params: { flat: { address: 'test' } }

      expect(response).to redirect_to flat_path(Flat.last)
    end

    it "creates a new flat increases the number of flats by 1" do
      number_of_flats = Flat.count
      post :create, params: { flat: { address: 'test2' } }

      expect(Flat.count).to eq(number_of_flats + 1)
    end

    it "does not create a new flat if address is missing" do
      post :create, params: { flat: { address: nil } }

      expect(response).to_not be_successful
    end

    it "re renders the new template if address is missing" do
      post :create, params: { flat: { address: '' } }

      expect(response).to render_template(:new)
    end
  end
end
