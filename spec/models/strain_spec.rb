require 'rails_helper'
require 'spec_helper'

RSpec.describe Strain, type: :model do
  it { should validate_uniqueness_of(:name) }
end

RSpec.describe Strain, type: :model do
  it "should not be blank or nil" do
    subject.name.should be_blank
    subject.valid?
    expect(page).not_to have_field('name', with: ' ')
    expect(page).not_to have_field('name', with: nil)
    expect(page).to have_field('name', with: 'Carmenere')
  end
end