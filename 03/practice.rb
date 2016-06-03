## Create a Scheduler class to assign interviews for each interviewer
## 1. Every interviewer has 4 available times: 9:00, 9:30, 10:00 and 10:30
## 2. Every interviewer has more or less the same amount of interviews
## 3. The code at the bottom must run without change
## Hint: http://ruby-doc.org/core-2.2.0/Array.html#method-i-sort

INTERVIEWERS = %w{ Eddie Jorge Rafa Edo Kuri Juan }

CANDIDATES = %w{ Jesus Alejandro Miguel Benjamin William Pablo Luis Rodrigo
				 Andres Josue Juan Yaser Omar Esteban Daniel Jose Gustavo Eduardo }

AVAILABLE_HOURS = %w{9:00 9:30 10:00 10:30 }

## Your code starts here

## Your code ends here





class Interviewers 
	attr_accessor :name
	def initialize(name)
		@name = name
	end

end

class Interview 
	attr_accessor :candidate , :interviewer , :time
	def initialize(candidate, interviewer,time)
		@candidate = Candidate.new(candidate)
		@interviewer = Interviewers.new(interviewer)
		@time = Time.new(time)

	end

end


class Candidate < Interview
	attr_accessor :name
	def initialize(name)
		@name = name
	end

end
class Time
	attr_accessor :time
	def initialize(time)
		@time = time
	end
end

class Scheduler < Interview
	
	INTERVIEWERz = %w{ Eddie Jorge Rafa Edo Kuri Juan }
	AVAILABLE_HOURZ = %w{9:00 9:30 10:00 10:30 }
	CANDIDATES = %w{ Jesus Alejandro Miguel Benjamin William Pablo Luis Rodrigo
		Andres Josue Juan Yaser Omar Esteban Daniel Jose Gustavo Eduardo }

		def initialize
			@interview = []
			@iterador = 0
		end
		def assign_interviews
			AVAILABLE_HOURZ.each do |time|

				INTERVIEWERz.each do|interviewer|
					@interview << Interview.new(CANDIDATES[@iterador], interviewer, time) if @iterador < CANDIDATES.length 
					@iterador = @iterador +1
				end

			end
		end

		def print_interviews

			@interview.each do |x|

				puts "La entrevista con #{x.candidate.name} la hará #{x.interviewer.name} a las #{x.time.time}"

			end

		end

	end

	scheduler = Scheduler.new

	scheduler.assign_interviews

	scheduler.print_interviews



