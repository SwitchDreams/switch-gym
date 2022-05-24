require "rails_helper"

RSpec.describe "/categories", type: :request do
  let(:teacher) { create(:user, role: :teacher) }
  let(:invalid_attributes) { { name: nil } }

  let(:valid_headers) { { "Authorization" => "Bearer #{teacher.token}" } }

  describe "GET /index" do
    it "renders a successful response" do
      create(:category)
      get categories_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      category = create(:category)
      get category_url(category), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Category" do
        expect do
          post categories_url,
               params: { category: attributes_for(:category) }, headers: valid_headers, as: :json
        end.to change(Category, :count).by(1)
      end

      it "renders a JSON response with the new category" do
        post categories_url,
             params: { category: attributes_for(:category) }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Category" do
        expect do
          post categories_url,
               params: { category: invalid_attributes }, as: :json
        end.not_to change(Category, :count)
      end

      it "renders a JSON response with errors for the new category" do
        post categories_url,
             params: { category: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { { name: "New Name" } }

      it "updates the requested category" do
        category = create(:category)
        patch category_url(category),
              params: { category: new_attributes }, headers: valid_headers, as: :json
        category.reload
        expect(category.name).to eq("New Name")
      end

      it "renders a JSON response with the category" do
        category = create(:category)
        patch category_url(category),
              params: { category: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the category" do
        category = create(:category)
        patch category_url(category),
              params: { category: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested category" do
      category = create(:category)
      expect do
        delete category_url(category), headers: valid_headers, as: :json
      end.to change(Category, :count).by(-1)
    end
  end
end
