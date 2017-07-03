require "rails_helper"

describe Order do

  it { should belong_to(:user)}
  it { should belong_to(:meal)}

  it { should have_many(:notifications)}

  it { is_expected.to callback(:calculate_price).before(:save) }

  describe "#payment" do
    it "returns true when payment is validated" do
      meal = create(:meal)
      order = create(:order)

      order_payed = order.payment

      expect(order_payed).to be_truthy
    end
  end

  describe "#calculate_price" do
    it "calculates the total price of the order" do
      meal = create(:meal, price: 4)
      order = create(:order, quantity: 2)

      total = order.calculate_price

      expect(total).to eq(8)
    end
  end
end
