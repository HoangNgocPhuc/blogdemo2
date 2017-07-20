require "rails_helper"
RSpec.describe User, type: :model do
  context "associations" do
    it {is_expected.to have_many :comments}
    it {is_expected.to have_many :posts}
  end
  context "validate" do
    it {is_expected.to validate_presence_of(:email)}
    it {is_expected.to validate_presence_of(:password)}
  end
end
