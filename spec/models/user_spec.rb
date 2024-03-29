require "rails_helper"

RSpec.describe User, type: :model do
  describe "factory" do
    context "when normal factory" do
      it { expect(build(:user)).to be_valid }
    end
  end
end
