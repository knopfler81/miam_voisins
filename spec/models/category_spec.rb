require "rails_helper"

describe Category do
  it {should have_many(:meals)}
  it { should validate_presence_of(:name)}
end
