class ApiConstraints
	def initialize(options)
		@version = options[:version]
		@default = options[:default]
	end

	def matches?(req)
		@default || reg.headers['Accept'].include?("application/vnd.smartcommunity.v#{@version}")
	end
end
