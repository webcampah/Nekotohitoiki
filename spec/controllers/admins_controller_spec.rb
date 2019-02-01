require 'rails_helper'

RSpec.describe AdminsController, type: :controller do

  describe "GET #user_index" do
    it "returns http success" do
      get :user_index
      expect(response).to have_http_status(:success)
    end
  end

end
