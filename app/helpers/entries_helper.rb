module EntriesHelper

	def has_selections?(entry)
		entry.selections.exists?
	end

	def is_current_week?(week)
		week === current_week(@current_time)
	end

end