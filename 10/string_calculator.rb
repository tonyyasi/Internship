class StringCalculator

	def numeric?(lookAhead)
  lookAhead =~ /[[:digit:]]/
end



	def add(string)
		if string.size == 0
			return 0 

		end

		arr = []
		negatives = []
		temporal = ''
		# arr = []
		# arr = string.gsub(/[\/n]/,',').split(',')
		# puts arr.inspect

		# arr.map(&:to_i).reduce(:+)

		temporal_string = ''
		string = string.gsub(/[\/n]/,',')
		#puts string

		string.each_char.with_index do |char,index|
			#puts char

			if(numeric?(char))
			temporal_string = temporal_string + char 

		else
			#puts temporal_string
			arr.push(temporal_string) if temporal_string != ''
			temporal_string = ''

		end

		if(char == '-' && numeric?(string[index+1]))
			negatives.push("-#{string[index+1]}")

		end



		end
		arr.push(temporal_string)

		puts arr.inspect

		
		if(negatives.empty?)
			arr.map(&:to_i).reduce(:+)
		else

			  "No negatives allowed " + "#{negatives.map{ |i|  %Q(#{i}) }.join(' ')}"
		end


		

	end

end



