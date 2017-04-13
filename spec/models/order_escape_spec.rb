require 'rails_helper'

RSpec.describe OrderEscape, type: :model do
  context "validations" do
    xit { is_expected.to validate_presence_of(:total) }
    xit { is_expected.to validate_presence_of(:quantity) }
  end
end

RSpec.describe OrderEscape, "associations", type: :model do
  it { should belong_to(:order) }
  it { should belong_to(:escape) }
end