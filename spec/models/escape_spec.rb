require 'rails_helper'

RSpec.describe Escape, type: :model do
  context "validations" do
    it { is_expected.to validate_presence_of(:name) }
     it { is_expected.to validate_presence_of(:description) }
      it { is_expected.to validate_presence_of(:price) }
       it { is_expected.to validate_presence_of(:city) }
        it { is_expected.to validate_presence_of(:image) }
  end
end

RSpec.describe Escape, "associations", type: :model do
  it { should have_many(:escape_categories) }
  it { should have_many(:categories).through(:escape_categories) }

  it { should have_many(:order_escapes) }
  it { should have_many(:orders).through(:order_escapes) }
end