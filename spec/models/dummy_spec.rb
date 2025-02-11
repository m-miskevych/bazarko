require 'rails_helper'

RSpec.describe Dummy, type: :model do
  it "must have an age greater than 21" do
    dummy = create(:dummy, age: 30)
    expect(dummy.age).to be >= 21
  end
end
