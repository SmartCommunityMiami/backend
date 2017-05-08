require 'rails_helper'

describe Report do
  before { 
  	@report = FactoryGirl.build(:report)
  }

  subject { @report }

  it { should respond_to(:issue) }
  it { should respond_to(:user) }
  it { should respond_to(:description) }
  it { should respond_to(:picture_link) }
  it { should respond_to(:latitude) }
  it { should respond_to(:longitude) }
  it { should respond_to(:date_resolved) }


  it { should be_valid }

  it { should validate_presence_of(:issue) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:longitude) }
  

  it { should have_many(:votes) }
  it { should belong_to(:issue) }
  it { should belong_to(:users) }

end
