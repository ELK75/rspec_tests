module Enumerable

	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i+=1
		end
		self
	end

	def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i+=1
		end
		self
	end

	def my_select
		selected_array = []
		self.size.times do |index|
			if yield(self[index])
				selected_array.push(self[index])
			end
		end
		selected_array
	end

	def my_all?
		self.size.times do |index|
			if !yield(self[index])
				return false
			end
		end
		true
	end

	def my_any?
		self.size.times do |index|
			if yield(self[index])
				return true
			end
		end
		false
	end

	def my_none?
		self.my_each {|e| return false if yield(e)}
		true
	end
end