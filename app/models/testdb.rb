class Testdb < ActiveRecord::Base
	def add_data(nodeId)
		self.nodeid = nodeId.to_s
	end
end