require 'rails_helper'

RSpec.describe User, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
  end
end

RSpec.describe User, "associations", type: :model do
  it { should have_many(:orders) }
end