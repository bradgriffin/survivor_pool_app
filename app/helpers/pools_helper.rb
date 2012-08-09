module PoolsHelper
	def auto_membership(pool)
		@user = current_user
    	pool = Pool.find_by_name(pool.name)
      	@membership = @pool.memberships.build("pool_id" => pool.id, "user_id" => @user.id)
      	@membership.save
	end
end
