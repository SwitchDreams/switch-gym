require "rails_helper"

RSpec.describe Users::RegistrationsController, type: :request do
  describe "POST /users" do
    let(:valid_attributes) { nested_attributes_for(:user) }

    context "with valid parameters" do
      it "creates a new User" do
        expect do
          post "/api/users",
               params: { user: valid_attributes }, as: :json
        end.to change(User, :count).by(1)
      end

      it "renders a JSON response with the new user" do
        post "/api/users",
             params: { user: valid_attributes }, as: :json
        expect(JSON.parse(response.body)["name"]).to eq(valid_attributes[:name])
      end
    end
  end

  describe "PUT /users" do
    let(:new_name) { "Roberto" }

    context "with valid parameters" do
      it "updates user info" do
        user = create(:user)
        expect do
          put "/api/users", params: { user: { name: new_name } },
                            headers: { "Authorization" => "Bearer #{user.token}" },
                            as: :json
          user.reload
        end.to change(user, :name).to(new_name)
      end
    end

    context "when user is not authenticated" do
      it "returns http status unauthorized" do
        put "/api/users", params: { user: { name: new_name } }, as: :json
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
