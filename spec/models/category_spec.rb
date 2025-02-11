require 'rails_helper'

RSpec.describe Category, type: :model do
  describe "associations" do
    it "has many items" do
      category = create(:category)
      item1 = create(:item, category: category)
      item2 = create(:item, category: category)

      expect(category.items).to include(item1, item2)
    end
  end

  describe "dependent: :nullify behavior" do
    it "nullifies category_id on associated items when category is destroyed" do
      category = create(:category)
      item = create(:item, category: category)

      category.destroy
      expect(Item.find(item.id).category_id).to be_nil
    end
  end
end
