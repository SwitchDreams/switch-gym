require "rails_helper"

RSpec.describe GymClassUser, type: :model do
  describe "factory" do
    context "when normal factory" do
      it { expect(build(:gym_class_user)).to be_valid }
    end
  end
end
