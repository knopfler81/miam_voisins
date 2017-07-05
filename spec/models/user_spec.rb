require 'rails_helper'

describe User  do
  it { should have_many(:meals)}
  it { should have_many(:received_orders)}
  it { should have_many(:prepared_orders)}
  it { should have_many(:orders)}
  it { should have_many(:reviews)}
  it { should have_many(:notifications)}


  describe "#completed_profile?" do
    it "returns true if the profile is completed" do
      user = create(:user, first_name: "John", last_name: "Doe", nickname: "JD" )

      user_complet = user.completed_profile?

      expect(user_complet).to be_truthy
    end

    it "returns false if the profile is not completed" do
      user = create(:user, first_name: "John", last_name: "", nickname: "JD" )

      user_complet = user.completed_profile?

      expect(user_complet).to be_falsy
    end
  end

  describe "#full_name" do
    it "returns the user's full name" do
      user = create(:user, first_name: "John", last_name: "Doe" )

      user_full_name = user.full_name

      expect(user_full_name).to eq("John Doe")
    end
  end

  describe "received_reviews" do
    it "returns the numbers of received reviews" do
      user = create(:user, first_name: "John", last_name: "Doe" )
      meal = create(:meal, user: user)
      first_review = create(:review, rating: 5, comment: "Super!", meal: meal )
      second_review = create(:review, rating: 2, comment: "Bof!", meal: meal )

      expect(user.received_reviews).to eq(2)
    end
  end

  describe "#rating_average" do
    it "returns the rating average" do
      user = create(:user, first_name: "John", last_name: "Doe" )
      meal = create(:meal, user: user)
      first_review = create(:review, rating: 5, comment: "Super!", meal: meal )
      second_review = create(:review, rating: 2, comment: "Bof!", meal: meal )

      expect(user.rating_average).to eq(3)
    end
  end


  describe "#signed_without_oauth?" do
    it "returns true if the provider is different from Facebook" do
      user = create(:user, first_name: "John", last_name: "Doe" )

      user_auth = user.signed_without_oauth?

      expect(user_auth).to be_truthy
    end

    it "returns false if the provider is different from Facebook" do
      user = create(:user, first_name: "John", last_name: "Doe", provider: "facebook" )

      user_auth = user.signed_without_oauth?

      expect(user_auth).to be_falsy
    end
  end


end


