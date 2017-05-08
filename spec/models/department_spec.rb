require 'rails_helper'

describe Department do
  before { @department = FactoryGirl.build(:department) }

  subject { @department }

  it { should respond_to(:email) }
  it { should respond_to(:name) }
  it { should respond_to(:phone) }
  it { should respond_to(:organization) }

  it { should be_valid }

  it { should validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { should validate_presence_of(:name) }

  it { should have_many(:issues) }

end
