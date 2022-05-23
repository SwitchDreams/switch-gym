require "rails_helper"

RSpec.describe GymClass, type: :model do
  describe "factory" do
    context "when normal factory" do
      it { expect(build(:gym_class)).to be_valid }
    end
  end
end
