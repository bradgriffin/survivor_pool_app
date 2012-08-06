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
  it { should respond_to(:authenticate) }
  it { should respond_to(:memberships) }
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

  describe "name address with mixed case" do
    let(:mixed_case_name) { "My NEw TeAm" }

    it "should be saved as all lower-case" do
      @pool.name = mixed_case_name
      @pool.save
      @pool.reload.name.should == mixed_case_name.downcase
    end
  end

  describe "when name is already taken" do
    before do
      pool_with_same_name = @pool.dup
      pool_with_same_name.name = @pool.name.upcase
      pool_with_same_name.save
    end

    it { should_not be_valid }
  end

  describe "with blank description" do
    before { @pool.description = " " }
    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @pool.password = @pool.password_confirmation = " " }
      it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @pool.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before { @pool.password_confirmation = nil }
    it { should_not be_valid }
  end

  describe "with a password that's too short" do
    before { @pool.password = @pool.password_confirmation = "a" * 3 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
  before { @pool.save }
  let(:found_pool) { Pool.find_by_name(@pool.name) }

    describe "with valid password" do
      it { should == found_pool.authenticate(@pool.password) }
    end

    describe "with invalid password" do
      let(:pool_for_invalid_password) { found_pool.authenticate("invalid") }

      it { should_not == pool_for_invalid_password }
      specify { pool_for_invalid_password.should be_false }
    end
  end

  describe "membership associations" do
   let!(:pool) { FactoryGirl.create(:pool, user: user) }
   let!(:membership) { FactoryGirl.create(:membership, pool: pool, user: user) }
    
   it "should destroy associated pools" do
     memberships = pool.memberships
     pool.destroy
     memberships.each do |membership|
       Membership.find_by_id(membership.id).should be_nil
     end
  end
  end
end
