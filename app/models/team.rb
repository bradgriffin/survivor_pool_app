class TotalGamesValidator < ActiveModel::Validator
	def validate(record)
		@fields = []
		options[:fields].each do |field|
			if record.send(field).nil?
			else
				@fields << record.send(field)
			end
		end

		if @fields.sum > 16
			record.errors[:base] << "There are 16 games in a season"
		end
	end
end

class Team < ActiveRecord::Base
	include ActiveModel::Validations
	attr_accessible :location, :nickname, :division, :coach, :wins_2011, :losses_2011, :wins_2012, :losses_2012

	validates :location, :nickname, :division, :coach, :wins_2011, :losses_2011, 
				:wins_2012, :losses_2012, presence: true
	validates :nickname, :coach, uniqueness: { case_sensitive: false }
	validates :wins_2011, :losses_2011, :wins_2012, :losses_2012, :numericality => { :less_than_or_equal_to => 16 }
	validates_with TotalGamesValidator, :fields => [:wins_2011, :losses_2011]
end


