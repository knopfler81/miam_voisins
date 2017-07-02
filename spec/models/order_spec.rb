require "rails_helper"

describe Order do

  it { should belong_to(:user)}
  it { should belong_to(:meal)}

  it { should have_many(:notifications)}

  #it { is_expected.to callback(:calculate_price).before(:save) }


end
