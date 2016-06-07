require "spec_helper"
require "./string_calculator"


describe StringCalculator do
	
let(:string_calculator) {StringCalculator.new}


describe "#Add" do 

	it "returns 0 when recieves "" " do

		expect(string_calculator.add("")).to eql(0)

	end

	it "returns 3 when recieves 2,1 " do

		expect(string_calculator.add("2,1")).to eql(3)

	end

	it "returns 6 when recieves 2,1,3 " do

		expect(string_calculator.add("2,1,3")).to eql(6)

	end

	it 'returns 6 when recieves 1\n2,3 ' do

		expect(string_calculator.add('1\n2,3')).to eql(6)

	end

	it 'returns 3 when recieves "//;\n1;2" ' do

		expect(string_calculator.add'//;\n1;2').to eql(3)
	end

	it 'returns negatives not allowed -6 -4' do
		expect(string_calculator.add('-6;1,3,-4')).to eql('No negatives allowed -6 -4')

	end

	





end



end