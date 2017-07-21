require "rails_helper"

RSpec.describe PostTag, type: :model do
  context "associations" do
    it do
      is_expected.to belong_to :tag
      is_expected.to belong_to :post
    end
  end
end
