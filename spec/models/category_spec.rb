require "rails_helper"

RSpec.describe Category, type: :model do
  describe "factory" do
    context "when normal factory" do
      it { expect(build(:category)).to be_valid }
    end
  end
end
