# frozen_string_literal: true

print 'Number of rows: '
row = gets.chomp.to_i
print 'Number of columns: '
col = gets.chomp.to_i
print 'Enter the number of generations: '
gen = gets.chomp.to_i

type_of_cells = ['*', '.']

grid = Array.new(row) { Array.new(col, '.') }

row.times do |i|
  col.times do |j|
    cell = type_of_cells[rand(2)]
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
  neighbors += 1 if grid[row - 1][col - 1] == '*' && row - 1 >= 0 && col - 1 >= 0

  neighbors += 1 if grid[row - 1][col] == '*' && row - 1 >= 0

  neighbors += 1 if grid[row - 1][col + 1] == '*' && row - 1 >= 0 && col + 1 < grid[0].length

  neighbors += 1 if grid[row][col - 1] == '*' && col - 1 >= 0

  neighbors += 1 if grid[row][col + 1] == '*' && col + 1 < grid[0].length

  neighbors += 1 if row + 1 < grid.length && col - 1 >= 0 && grid[row + 1][col - 1] == '*'

  neighbors += 1 if row + 1 < grid.length && grid[row + 1][col] == '*'

  neighbors += 1 if row + 1 < grid.length && col + 1 < grid[0].length && grid[row + 1][col + 1] == '*'

  neighbors
end

def new_gen(grid)
  row = grid.length
  col = grid[0].length

  new_grid = Array.new(row) { Array.new(col, '.') }
  row.times do |i|
    col.times do |j|
      neighbors = count_neighbors(grid, i, j)
      cell = '.'
      if grid[i][j] == '*' && neighbors < 2
        cell = '.'

      elsif grid[i][j] == '*' && neighbors > 3
        cell = '.'

      elsif grid[i][j] == '*' && neighbors >= 2
        cell = '*'

      elsif grid[i][j] == '.' && neighbors == 3
        cell = '*'
      end
      new_grid[i][j] = cell
    end
  end
  new_grid
end

def game_of_life(grid, gen)
  gen.times do |i|
    grid = new_gen(grid)
    puts "Generation #{i + 1}"
    print_grid(grid)
  end
  grid
end

game_of_life(grid, gen)
