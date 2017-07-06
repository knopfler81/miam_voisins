require 'rails_helper'

describe Meal do
  it { should belong_to(:category)}
  it { should belong_to(:user)}
  it { should have_many(:ingredients)}
  it { should have_many(:orders)}
  it { should have_many(:notifications)}
  it { should have_many(:reviews)}

  it { should validate_presence_of(:menu_name)}
  it { should validate_presence_of(:price)}
  it { should validate_presence_of(:portion)}
  it { should validate_presence_of(:availability)}
  it { should validate_presence_of(:category)}
  it { should validate_presence_of(:location)}
  it { should validate_presence_of(:menu_name)}


  describe "#passed?" do
    it "returns true if the meal's avaibility is passed" do
      meal = create(:meal, availability: 2.days.ago)

      meal = meal.passed?

      expect(meal).to be_truthy
    end

    it "returns false if the meal's avaibility is not passed yet" do
      meal = create(:meal, availability: 2.days.from_now)

      meal = meal.passed?

      expect(meal).to be_falsy
    end
  end



  describe "#coming?" do
    it "returns only coming meals" do
      coming_meal = create(:meal, availability: 2.days.from_now)
      passed_meal = create(:meal, availability: 2.days.ago)

      test_coming_meal = coming_meal.coming?

      expect(test_coming_meal).to be_truthy
    end
  end

  describe "#left_meal" do
    it "display only the meal that are still available" do
      meal = create(:meal, portion: 2)

      show_meal = meal.left_meal

      expect(show_meal).to eq(2)
    end
  end
end
