require "rails_helper"

RSpec.describe Tag, type: :model do
  context "associations" do
    it{is_expected.to have_many :post_tags }
  end
end
