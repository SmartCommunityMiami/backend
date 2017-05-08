require 'rails_helper'

describe Issue do
  before { 
  	@issue = FactoryGirl.build(:issue)
  }

  subject { @issue }

  it { should respond_to(:description) }
  it { should respond_to(:department) }

  it { should be_valid }

  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:department) }

  it { should have_many(:reports) }
  it { should belong_to(:department) }


end
