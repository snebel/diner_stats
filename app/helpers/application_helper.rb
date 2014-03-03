module ApplicationHelper
	def sum(arr, column)
		arr.inject(0) {|sum, a| sum += a.column}
	end
end
