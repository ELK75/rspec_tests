require '../caesar_cipher.rb'
require 'rspec'

describe "caesar_cipher" do


	it "shift input by given factor" do
		caesar_cipher("caesar",3).should == "fdhvdu"
	end

	it "should not shift given 0" do
		caesar_cipher("caesar", 0).should == "caesar"
	end

	it "should handle shifts greater than 26" do
		caesar_cipher("how you doin", 30).should == "lsa csy hsmr"
	end

	it "should retain capitilization" do
		expect(caesar_cipher("How You Doin", 30)).to eq("Lsa Csy Hsmr")
	end

	it "should handle other characters" do
		caesar_cipher("how, you doin?", 30).should == "lsa, csy hsmr?"
	end

end