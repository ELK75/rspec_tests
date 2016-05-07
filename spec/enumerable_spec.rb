require_relative '../enumerable.rb'
require 'rspec'

items = [1, 2, 3, 4]

describe "my_each" do

  result = []
  items.my_each do |n|
    result << n * 2
  end

  it "should be able to double elements" do
  	expect(result).to eq([2, 4, 6, 8])
  end
end

describe "my_each_with_index" do

	result = []
	items.my_each_with_index do |n, i|
		(i % 2).zero? ? result << n * 2 : result << n
	end

	it "should double if the index is even" do
		expect(result).to eq([2, 2, 6, 4])
	end
end

describe "my_select" do

	it "should keep the even numbers in the array" do
		expect(items.my_select {|x| x.even?}).to eq([2, 4])
	end

end

describe "my_all?" do

	it "should return true if all elements are true" do
		expect(%w{ant bear cat}.all? {|word| word.length >= 3}).
		to eq(true)
	end

	it "should return false if all elements are false" do
		expect(%w{ant bear cat}.all? {|word| word.length >= 4}).
		to eq(false)
	end

	it "should work on array of numbers" do
		expect(items.all? {|x| x < 5}).to eq(true)
	end

end

describe "my_any?" do

	it "should return true if any elements are true" do
		expect(%w{an bear cat}.my_any? {|word| word.length >= 2}).
		to eq(true)
	end

	it "should return false if all elements are false" do
		expect(%w{ant bet cat}.my_any? {|word| word.length >= 4}).
		to eq(false)
	end

	it "should work on array of numbers" do
		expect(items.my_any? {|x| x == 2}).to eq(true)
	end
	
end

describe "my_none?" do

	it "should return false if any elements are true" do
		expect(%w{an bear cat}.my_none? {|word| word.length >= 2}).
		to eq(false)
	end

	it "should return true if all elements are false" do
		expect(%w{ant bet cat}.my_none? {|word| word.length >= 4}).
		to eq(true)
	end

	it "should work on array of numbers" do
		expect(items.my_none? {|x| x == 2}).to eq(false)
	end

end



