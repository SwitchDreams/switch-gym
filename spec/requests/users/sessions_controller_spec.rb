require "rails_helper"

RSpec.describe Users::SessionsController, type: :request do
  let(:password) { "123456" }
  let(:user) { create(:user, password:) }

  describe "POST /users/login" do
    context "with valid parameters" do
      it "returns a user jwt token in headers" do
        post "/api/users/login",
             params: { user: { email: user.email, password: } }, as: :json
        expect(response.headers["Authorization"]).to be_present
      end

      it "returns a http success" do
        post "/api/users/login",
             params: { user: { email: user.email, password: } }, as: :json
        expect(response).to be_successful
      end
    end

    context "with invalid password" do
      it "returns error message in json" do
        post "/api/users/login",
             params: { email: user.email, password: "wrong password" }, as: :json
        expect(JSON.parse(response.body)["error"]).to be_present
      end
    end

    context "when user is status pending" do
      it "returns error message in json" do
        user = create(:user, password:)
        post "/api/users/login",
             params: { email: user.email, password: }, as: :json
        expect(JSON.parse(response.body)["error"]).to be_present
      end
    end

    context "when email and password are empty" do
      it "returns unauthorized" do
        post "/api/users/login",
             params: { email: "", password: "" }, as: :json
        expect(response).to be_unauthorized
      end
    end
  end

  describe "DELETE /users/logout" do
    it "creates and JwtDenyList record" do
      expect do
        delete "/api/users/logout",
               headers: { "Authorization" => "Bearer #{user.token}" }
      end.to change(JwtDenylist, :count).by(1)
    end
  end
end
