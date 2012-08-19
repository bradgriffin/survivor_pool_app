require 'spec_helper'

describe Membership do
  let(:user) { FactoryGirl.create(:user) }
  let(:pool) { FactoryGirl.create(:pool, user: user) }
  before do
    user.save
    pool.save
    @membership = pool.memberships.build(user_id: user.id)
  end

  subject { @membership }

  it { should respond_to(:pool_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:pool) }

  it { should be_valid }

  describe "when pool id is not present" do
    before { @membership.pool_id = "" }
    it {should_not be_valid}
  end

  describe "when user id is not present" do
    before { @membership.user_id = "" }
    it {should_not be_valid}
  end

end
