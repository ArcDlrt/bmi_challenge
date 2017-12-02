require 'rails_helper'

RSpec.describe BmiCalculatorsController, type: :controller do
  context "User signed in" do

    before(:each) do
      @user = FactoryGirl.create(:user)
    end

    it "renders the index" do
      sign_in @user

      expect(subject.current_user).to be_an_instance_of(User)

      get :index

      expect(response.status).to eql(200)
      expect(response).to render_template(:index)
    end

    after(:each) do
      sign_out @user
    end
  end

  context "User has't signed in" do
    it "redirects user to the sign in view" do
      get :index

      expect(response.status).to eql(302)
      expect(response).to redirect_to(new_user_session_path)
    end
  end

end
