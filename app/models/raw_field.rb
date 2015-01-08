class RawField < ActiveRecord::Base

	def addData(nodeId, dateTime, valueArray)
		self.nodeid = nodeId.to_s
		self.datetime = dateTime.to_s
		self.valuearray = valueArray.to_s
	end

end