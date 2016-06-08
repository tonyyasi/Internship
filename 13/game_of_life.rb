require 'matrix'

class Game

	def initialize(n)

		@worlds = []
		@seed = seed_generator

	end

	def seed_generator(n)

		seed = Matrix.new(n)

		seed.each do |cell|

			cell = rand(2)
		end


	end


end

class World

def initialize(matrix)

	@world = matrix

end


end