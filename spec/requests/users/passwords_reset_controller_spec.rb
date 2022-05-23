require "rails_helper"

RSpec.describe Users::PasswordsResetController, type: :request do
  let(:password) { "123456" }
  let(:user) { create(:user, password:) }
  let(:headers) { { "Authorization" => "Bearer #{user.token}" } }

  describe "POST /users/password" do
    it "returns http success" do
      post "/api/users/password", params: { user: { email: user.email } }, headers: headers, as: :json
      expect(response).to have_http_status(:success)
    end
  end

  describe "PUT /users/password" do
    let(:new_password) { "1234568" }
    let(:reset_password_token) { user.send_reset_password_instructions }

    it "returns http success" do
      put "/api/users/password", params: { user: { reset_password_token:,
                                                   password: new_password } }, headers: headers, as: :json
      expect(response).to have_http_status(:success)
    end

    it "creates an valid password" do
      put "/api/users/password", params: { user: { reset_password_token:,
                                                   password: new_password } }, headers: headers, as: :json
      user.reload
      expect(user).to be_valid_password(new_password)
    end
  end
end
