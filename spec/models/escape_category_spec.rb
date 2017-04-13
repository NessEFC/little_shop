require 'rails_helper'

RSpec.describe EscapeCategory, "associations", type: :model do
  it { should belong_to(:escape) }
  it { should belong_to(:category) }
end