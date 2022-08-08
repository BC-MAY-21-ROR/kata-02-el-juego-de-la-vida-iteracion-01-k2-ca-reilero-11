# frozen_string_literal: true

print 'Number of rows: '
row = gets.chomp.to_i
print 'Number of columns: '
col = gets.chomp.to_i

# print "Enter the number of cells:"
# cells = gets.chomp.to_i

typeOfCells = ['*', '.']

grid = Array.new(row) { Array.new(col, '.') }

row.times do |i|
	col.times do |j|
		cell = typeOfCells[rand(2)]
		grid[i][j] = cell
	end
end

def print_grid(grid)
	grid.each do |row|
		puts row.join(' ')
	end
end

# randomRow = rand(row)
# randomCol = rand(col)

# grid[randomRow][randomCol] = '*'

print_grid(grid)
