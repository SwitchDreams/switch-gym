require "rails_helper"

RSpec.describe "/gym_class_users", type: :request do
  let(:invalid_attributes) { { user: nil } }

  let(:valid_headers) do
    {}
  end

  describe "GET /index" do
    it "renders a successful response" do
      create(:gym_class_user)
      get gym_class_users_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      gym_class_user = create(:gym_class_user)
      get gym_class_user_url(gym_class_user), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      let(:user) { create(:user) }
      let(:gym_class) { create(:gym_class) }

      it "creates a new GymClassUser" do
        expect do
          post gym_class_users_url,
               params: { gym_class_user: { user_id: user.id, gym_class_id: gym_class.id } }, headers: valid_headers, as: :json
        end.to change(GymClassUser, :count).by(1)
      end

      it "renders a JSON response with the new gym_class_user" do
        post gym_class_users_url,
             params: { gym_class_user: { user_id: user.id, gym_class_id: gym_class.id } }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new GymClassUser" do
        expect do
          post gym_class_users_url,
               params: { gym_class_user: invalid_attributes }, as: :json
        end.not_to change(GymClassUser, :count)
      end

      it "renders a JSON response with errors for the new gym_class_user" do
        post gym_class_users_url,
             params: { gym_class_user: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested gym_class_user" do
      gym_class_user = create(:gym_class_user)
      expect do
        delete gym_class_user_url(gym_class_user), headers: valid_headers, as: :json
      end.to change(GymClassUser, :count).by(-1)
    end
  end
end
