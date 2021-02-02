
def initialize_grid(n, filler)
  n.times.inject([]) {|grid,_| grid << Array.new(n, filler) }
  
end

def draw(grid)
  grid.each { |line| puts line.join("") }
end

def star(n, sym)
  grid = initialize_grid(n, " ")

  0.upto(n-1) do |i|
    grid[i][i] = sym #first Diagonal
    grid[n-i-1][i] = sym #second diagonal
    grid[(n-1)/2][i] = sym #Vertical Line
    grid[i][(n-1)/2] = sym #Horizontal Line
  end
  draw(grid)
end

def circle(n, sym)
  grid = initialize_grid(n, " ")
  delta = 1
  radius = (n - 1) / 2
  0.step(by: delta, to: 360) do |angle|
    x = (Math.sin(angle) * radius + radius).round
    y = (Math.cos(angle) * radius + radius).round
    grid[x][y] = sym
  end
  draw(grid)
end

def sine_wave(n, sym)
  grid = initialize_grid(n, " ")
  delta = 0.01
  steps = 0
  delta.step(by: delta, to: n-1) do |param|
    #Map 0 -> n to -pi -> pi
    x = (param / n.to_f - 0.5) * 2 * Math::PI 
    y = ((Math.sin(x) * ((n-1)/2))+((n-1)/2)).round
    grid[y][param] = sym
    steps += 1
  end
  draw(grid)

end

star(11, "*")
circle(11, "*")
sine_wave(21,"*")
