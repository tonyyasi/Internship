class Calculator

	def add(*args)

		args.reduce(0,:+)
	#	10

	end

	def subtract(*args)
		args.reduce(:-)
	end

	def multiply(*args)
		args.reduce(:*)
	end

	def divide(*args)

		args.each_with_index do |value, index|

			if value == 0 && index >0
				return "error"
			end

		end

		args.reduce(:/)

	end

end



end