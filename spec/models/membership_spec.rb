require 'spec_helper'

describe Membership do
  let(:user) { FactoryGirl.create(:user) }
  let(:pool) { FactoryGirl.create(:pool, user: user) }
  before do
    user.save
    pool.save
    @membership = pool.memberships.build(pool_id: pool.id, user_id: user.id)
  end

  subject { @membership }

  it { should respond_to(:pool_id) }
  it { should respond_to(:user_id) }
  it { should respond_to(:pool) }
  it { should respond_to(:user) }

  it { should be_valid }

end
