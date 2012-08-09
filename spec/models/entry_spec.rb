require 'spec_helper'

describe Entry do
  let(:user) { FactoryGirl.create(:user) }
  let(:pool) { FactoryGirl.create(:pool, user: user) }
  before do
    user.save
    pool.save
    @membership = pool.memberships.build(pool_id: pool.id, user_id: user.id)
    @membership.save
    @entry = user.entries.build(name: "Example Entry", user_id: user.id, pool_id: pool.id)
  end

  subject { @entry }

  it { should respond_to(:name) }
  it { should respond_to(:pool_id) }
  it { should respond_to(:user_id) }

  it { should be_valid }

  describe "when name is not present" do
  	before { @entry.name = "" }
  	it { should_not be_valid }
  end

  describe "when name is too long" do
  	before { @entry.name = "a" * 15 }
  	it { should_not be_valid }
  end

  # describe "when name has been taken" do
  # this is a challenge because it should be scoped by pool

end
