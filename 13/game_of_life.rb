require 'matrix'

class Game

	def initialize(n)

		@worlds = []
		@seed = seed_generator
		@worlds << World.new(@seed)
	end

	def seed_generator(n)

		seed = Matrix.new(n)

		seed.each do |dimension|

			dimension = Array.new(n)

			dimension.each do |cell|

				cell = rand(2)
			end

		end


	end


end

class World

def initialize(matrix)

	@world = matrix

end

def number_of_alive_neighbors(x,y,z)



	end


end