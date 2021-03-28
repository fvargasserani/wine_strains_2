require 'rails_helper'
require 'spec_helper'

RSpec.describe Strain, type: :model do
  it { should validate_uniqueness_of(:name) }
end

RSpec.describe Strain, type: :model do
  it "should not be blank or nil" do
    strain = Strain.create(name: ' ')
    expect(strain).to_not be_valid
    strain = Strain.create(name: nil)
    expect(strain).to_not be_valid
    strain = Strain.create(name: 'Carmenere')
    expect(strain).to be_valid
  end
end