require 'spec_helper'

describe Pool do
  let(:user) { FactoryGirl.create(:user) }
  before { @pool = user.pools.build(name: "Tester", description: "Lorem ipsum", 
  							password: "foobar", password_confirmation: "foobar") }
  subject { @pool }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:user_id) }
  it { should respond_to(:user) }
  its(:user) { should == user }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @pool.user_id = nil }
    it { should_not be_valid }
  end

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Pool.new(user_id: user.id)
      end.should raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end    
  end

  describe "with blank description" do
    before { @pool.description = " " }
    it { should_not be_valid }
  end

end
