

def repeater(n = 1)
	n.times do 
		puts square(n)
	end
	end
def square(n)

	n * n
end
def email_to(email, &block)
puts "Hola #{email}"
yield if block_given?
puts "Fin del mensaje"

end

 email_to("tonyyasi@gmail.com") do

puts "Como te va amigo"
 end
say_hi = -> {puts "Hello World"}
say_hi.yield

square = -> (number) {puts number*number}
square.yield(10)

(1..5).map {|n| n*n}
#(1..5).map(&:square)
(1..5).map(&square)

puts (1..5).reduce {|n,acum| n+acum}
puts (1..5).reduce(:+)