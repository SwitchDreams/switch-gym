require "rails_helper"

RSpec.describe GymClassesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/gym_classes").to route_to("gym_classes#index")
    end

    it "routes to #show" do
      expect(get: "/gym_classes/1").to route_to("gym_classes#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/gym_classes").to route_to("gym_classes#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/gym_classes/1").to route_to("gym_classes#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/gym_classes/1").to route_to("gym_classes#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/gym_classes/1").to route_to("gym_classes#destroy", id: "1")
    end
  end
end
