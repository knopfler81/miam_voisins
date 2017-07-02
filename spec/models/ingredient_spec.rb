require "rails_helper"


describe Ingredient do
  it { should belong_to(:meal)}
  it { should validate_presence_of(:name)}
end
