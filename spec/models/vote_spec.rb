require 'rails_helper'

describe Vote do
  before { 
  	@vote = FactoryGirl.build(:vote)
  }

  subject { @vote }

  it { should respond_to(:report) }
  it { should respond_to(:user) }
  it { should respond_to(:direction) }

  it { should be_valid }

  it { should validate_presence_of(:report) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:direction) }


  it { should belong_to(:report) }
  it { should belong_to(:user) }

end