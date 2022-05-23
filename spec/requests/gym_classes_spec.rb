require "rails_helper"

RSpec.describe "/gym_classes", type: :request do
  let(:invalid_attributes) do
    attributes_for(:gym_class, name: nil)
  end

  let(:valid_headers) do
    {}
  end

  describe "GET /index" do
    it "renders a successful response" do
      create(:gym_class)
      get gym_classes_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      gym_class = create(:gym_class)
      get gym_class_url(gym_class), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    let(:category) { create(:category) }

    context "with valid parameters" do
      it "creates a new GymClass" do
        expect do
          post gym_classes_url,
               params: { gym_class: attributes_for(:gym_class, category_id: category.id) }, headers: valid_headers, as: :json
        end.to change(GymClass, :count).by(1)
      end

      it "renders a JSON response with the new gym_class" do
        post gym_classes_url,
             params: { gym_class: attributes_for(:gym_class, category_id: category.id) }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new GymClass" do
        expect do
          post gym_classes_url,
               params: { gym_class: invalid_attributes }, as: :json
        end.not_to change(GymClass, :count)
      end

      it "renders a JSON response with errors for the new gym_class" do
        post gym_classes_url,
             params: { gym_class: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        { name: "New name" }
      end

      it "updates the requested gym_class" do
        gym_class = create(:gym_class)
        patch gym_class_url(gym_class),
              params: { gym_class: new_attributes }, headers: valid_headers, as: :json
        gym_class.reload
        expect(gym_class.name).to eq("New name")
      end

      it "renders a JSON response with the gym_class" do
        gym_class = create(:gym_class)
        patch gym_class_url(gym_class),
              params: { gym_class: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the gym_class" do
        gym_class = create(:gym_class)
        patch gym_class_url(gym_class),
              params: { gym_class: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested gym_class" do
      gym_class = create(:gym_class)
      expect do
        delete gym_class_url(gym_class), headers: valid_headers, as: :json
      end.to change(GymClass, :count).by(-1)
    end
  end
end
