class User < ActiveRecord::Base
	require 'roo'

	# def self.import(file)
	# 	CSV.foreach(file.path, headers:true) do |row|
	# 		User.create! row.to_hash
	# 	end
	# end

	def self.read_excel excel_file
		arr = []
		val = []
		h = Hash.new 
		file = Roo::Spreadsheet.open(excel_file)
		i = 4964
		while file.cell(i,1) != nil
			file.each_with_pagename do |name, sheet|
				if arr.length != 0
					if !arr.to_set.include?(sheet.row(i)[0]) 
						arr.push(sheet.row(i)[0])
						h[(sheet.row(i)[0])] = val<<sheet.row(i)[1]
						
					else
						h[(sheet.row(i)[0])] = val<<sheet.row(i)[1]
					end

				else
					arr.push(sheet.row(i)[0])
					
					h[(sheet.row(i)[0])] = val<<sheet.row(i)[1]
					
				end
				
			end
			
			i+=1
			
		end
		if i>2
		return	h
		else
			false
		end
	end

	# def hash(key,value)
	# 	arr.push(h[:key]=value)
	# end
end
