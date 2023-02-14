require 'rails_helper'

RSpec.describe "FirstNames", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/first_name/new"
      expect(response).to have_http_status(:success)
    end
  end

end
