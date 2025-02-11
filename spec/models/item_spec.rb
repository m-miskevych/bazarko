require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "associations" do
    it "belongs to a category" do
      category = create(:category)
      item = create(:item, category: category)

      expect(item.category).to eq(category)
    end

    it "belongs to a user" do
      user = create(:user)
      item = create(:item, user: user)

      expect(item.user).to eq(user)
    end
  end
end
