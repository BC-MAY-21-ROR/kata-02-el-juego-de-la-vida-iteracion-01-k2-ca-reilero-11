print 'Number of rows: '
row = gets.chomp.to_i
print 'Number of columns: '
col = gets.chomp.to_i

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

def count_neighbors(grid, row, col)
	neighbors = 0
	if grid[row - 1][col - 1] == '*' && row - 1 >= 0 && col - 1 >= 0
		neighbors += 1
	end

	if grid[row - 1][col] == '*' && row - 1 >= 0
		neighbors += 1
	end

	if grid[row - 1][col + 1] == '*' && row - 1 >= 0 && col + 1 < grid[0].length
		neighbors += 1
	end

	if grid[row][col - 1] == '*' && col - 1 >= 0
		neighbors += 1
	end

	if grid[row][col + 1] == '*' && col + 1 < grid[0].length
		neighbors += 1
	end

	if grid[row + 1][col - 1] == '*' && row + 1 < grid.length && col - 1 >= 0
		neighbors += 1
	end

	if grid[row + 1][col] == '*' && row + 1 < grid.length
		neighbors += 1
	end

	if grid[row + 1][col + 1] == '*' && row + 1 < grid.length && col + 1 < grid[0].length
		neighbors += 1
	end

	return neighbors
end

puts count_neighbors(grid, 0,0)


def new_gen(grid,row,col)
	grid_2 = Array.new(row) { Array.new(col, '.') }
	row.times do |i|
		col.times do |j|
			puts j
			n = count_neighbors(grid, i, j)
			cell = ""
			if (grid[i][j] == "*" && n < 2)
				cell = "."
			
			elsif (grid[i][j] == "*" && n > 3)
				cell = "."
			
			elsif (grid[i][j] == "*" && n > 2)
				cell = "*"
			
			elsif (grid[i][j] == "." && n == 3)
				cell = "*"
			end
			grid_2[i][j] = cell
		end
	end
	print_grid(grid_2)
end

# puts grid[0][0]

print_grid(grid)
new_gen(grid,row,col)