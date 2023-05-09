# frozen_string_literal: true

RSpec.describe Author do
  it "has a valid factory" do
    FactoryBot.build(:author).should be_valid
  end

  it "is invalid without a first name" do
    FactoryBot.build(:author, first_name: nil).should_not be_valid
  end

  it "is invalid without a last name" do
    FactoryBot.build(:author, last_name: nil).should_not be_valid
  end
end
