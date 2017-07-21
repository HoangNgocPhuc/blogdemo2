require "rails_helper"

RSpec.describe Relationship, type: :model do
  context "associations" do
    it do
      is_expected.to belong_to :follower
      is_expected.to belong_to :followed
    end
  end
end
