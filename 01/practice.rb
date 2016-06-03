# Write a script that gets the name and age of 3 people (name, age)
# Store them in an array of hashes named people e.g. {name: 'Adrian', age: 29}
# Further steps:
# 1. Select only the person who is under 20 years
# 2. Select only the persons with name starting with 'a'
# 3. Sort the persons by age, from young to old

# Your script starts here

# Your script ends here
PEOPLE = [{name: "Tony1", age:20} , {name: "Tony2" , age: 12} , {name: "alf" , age: 18}]

class Person 
	attr_accessor :name,:age

	def initialize(name,age)
		@name = name
		@age = age
	end

	def self.under_twenty(array_of_people)
		array_of_people.each do |person|
			puts person.name if person.age <20
		end
	end

	def self.name_starts_with_a(array_of_people)
			array_of_people.each do |person|
			puts person.name if person.name[0] == "a" 
		end

	end

	def self.sort_by_ages(array_of_people)
		array_of_people.sort{ |person1,person2| person1.age <=> person2.age}
	end

end




#people.each do |person|
#
#	if person[:age].to_i<20
#		puts "Name: #{person[:name]} Age: #{person[:age]} is younger than 20"
#	end
#
#	if person[:name][0] == "a"
#		puts  "Name: #{person[:name]} Age: #{person[:age]}'s name start with a"
#	end



#	end

#	people.sort_by!{|hash|  hash[:age]}


array_of_people = PEOPLE.map {|person| Person.new(person[:name], person[:age]) }

 Person.under_twenty(array_of_people)
 Person.name_starts_with_a(array_of_people)

 people_sorted = Person.sort_by_ages(array_of_people)
 people_sorted.each {|a| puts a.name}
# !! Bonus
# Store the age in the hash as an integer
