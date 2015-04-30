class Org < ActiveRecord::Base

	def set_name
		self.name = get_crunchbase_name(self.url)
	end

private

	def get_crunchbase_name(url)
		org = Crunchbase::Search.search({ domain_name: url }, 'organizations')

		if org.results[0]
			cb_name = org.results[0].name
			self.increment_name_score
		end

		return cb_name
	end

	def increment_name_score
		self.name_score += 1
	end

end
