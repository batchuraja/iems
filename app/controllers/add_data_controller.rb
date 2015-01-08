class AddDataController < ApplicationController

	def index
		testDate = Time.now
		#DateTime.new(2014,10,6)
		newField = RawField.new
		newField.nodeid = params[:nodeid]
		newField.datetime = testDate
		newField.valuearray = params[:valuearray]
		
		if newField.save
			@isSaved = true

		else
			@isSaved = false
		end

		#@testdb.add_data(String.new('id'))
		#field = RawField.new(:nodeid => params['nodeid'], :datetime => params['datetime'], :valuearray => ['valuearray'])

		#@raw_field.add_data(params['nodeid'])
	end

end