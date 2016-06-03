class Person 
	attr_accessor :age,:name
	def initialize(name = "John",age=22)
		@name = name
		@age = age
	end

end



#accessor es read/write
#reder es read
#writer es lector

person = Person.new("Tony",20)
puts person.name
class Animal
	attr_reader :name
def initialize(name)
@name = name
end

def make_sound
	""
end
	end

class Duck < Animal

def make_sound
	"Quack"
end

end

class Cow < Animal

def make_sound
	"MooooOOo"
end
	end

	
	class Rhino < Animal

	end

	rhino = Rhino.new("Rhino")
	puts rhino.make_sound

	module Area
		PI = 3.1416

	def self.square(side)
		side * side
	end

	def self.circle(radius)
		PI * radius * radius
	end
	end

	module Mailer

		def email_to(email,&block)
			puts "Hello #{email}"
			yield block if block_given?
			puts ";)"
		end

	end

	class User
		include Mailer


	end

	user = User.new
	user.email_to "tonyyasi@gmail.com" do 
		puts "Esto es un mensajito locochon"

	end

	puts Area.square(5)
	puts Area::PI