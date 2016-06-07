require "spec_helper"
require"./calculator"


describe Calculator do 
	let(:string_calc) {String_Calc.new}
	let(:calculator) {Calculator.new}
	describe "#add" do	

		it "returns 10 when recieves 4 & 6" do	

			
			expect(calculator.add(4,6)).to eql(10)
		end

		it "returns 14 when recieves 7 & 14" do
			
			expect(calculator.add(7,14)).to eql(21)
		end

		it "returns -5 when recieves 0 & -5" do
			
			expect(calculator.add(0,-5)).to eql(-5)
		end

		it "returns 6 when recieve 1 , 2 & 3" do

			expect(calculator.add(1,2,3)).to eql(6)

		end

	end

	describe "#subtract" do

		it "returns 0 when recieves -2 & -2" do
			expect(calculator.subtract(-2,-2)).to eql(0)
		end

		it "returns 2 when recieves 6 & 4" do
			expect(calculator.subtract(6,4)).to eql(2)
		end

		it "returns -2 when recieves 4 & 6" do
			expect(calculator.subtract(4,6)).to eql(-2)
		end

		it "returns 12 when recieves 2 & -10" do
			expect(calculator.subtract(2,-10)).to eql(12)
		end

		it "returns 0 when recieves 3,2,1" do 

			expect(calculator.subtract(3,2,1)).to eql(0)

		end

		it "returns 16 when recieves -2 , -4 , -6 , -8" do

			expect(calculator.subtract(-2,-4,-6,-8)).to eql(16)

		end

	end
	
	describe "#multiply" do

		it "returns 25 when recieves 5 & 5" do
			expect(calculator.multiply(5,5)).to eql(25)
		end

		it "returns 0 when recieves 0 & 5" do
			expect(calculator.multiply(0,5)).to eql(0)
		end

		it "returns -40 when recieves -8 & 5" do
			expect(calculator.multiply(-8,5)).to eql(-40)
		end

		it "returns 64 when recieves -8 & -8" do
			expect(calculator.multiply(-8,-8)).to eql(64)
		end

		it "returns 125 when recieves 5 , 5 , 5" do
			expect(calculator.multiply(5,5,5)).to eql(125)
		end

	end

	describe "#divide" do 

		it "returns 1 when recieves 5 & 5" do
			expect(calculator.divide(5,5)).to eql(1)
		end

		it "returns 0 when recieves 0 & 10" do
			expect(calculator.divide(0,10)).to eql(0)
		end

		it "returns error when recieves 5 & 0" do
			expect(calculator.divide(5,0)).to eql("error")
		end

		it "returns -10 when recieves 100 & -10" do
			expect(calculator.divide(100,-10)).to eql(-10)
		end

		it "returns error when recieves 3 , 5 , 0" do
			expect(calculator.divide(3,5,0)).to eql("error")
		end

		it "returns 1 when recieves 100, -10, -10" do
			expect(calculator.divide(100,-10,-10)).to eql(1)
		end


	end



end