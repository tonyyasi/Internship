class StringCalculator

	def numeric?(lookAhead)
		lookAhead =~ /[[:digit:]]/
	end

	def add(string)
		return 0 if string.empty?

		arr = []
		negatives = []
		temporal_string = ''
		string = string.gsub('\n',',')

		string.each_char.with_index do |char,index|

			if numeric?(char)
				temporal_string = temporal_string + char 
			else
				arr.push(temporal_string) if temporal_string != ''
				temporal_string = ''
			end

			if char == '-' && numeric?(string[index+1])
				negatives.push("-#{string[index+1]}")
			end
		end

		arr.push(temporal_string)
		
		if negatives.empty?
			arr.map(&:to_i).reduce(:+)
		else
			"No negatives allowed " + "#{negatives.join(' ')}"
		end
	end
end
