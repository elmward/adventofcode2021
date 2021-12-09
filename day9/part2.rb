def main
  map = File.readlines('./input.txt').map { |line| line.chomp.chars.map(&:to_i) }
  basins = []
  visited = {}
  low_points = []
  (0..map[0].length - 1).each do |x|
    (0..map.length - 1).each do |y|
      low_points << [x, y] if adjacencies(x, y, map).all? { |adj_x, adj_y| map[adj_y][adj_x] > map[y][x] }
    end
  end

  basins = []
  visited = {}
  low_points.each do |x , y|
    basins << explore_basin(map, x, y, visited, [])
  end

  puts basins.map(&:size).sort.last(3).reduce(:*)
end

def explore_basin(map, x, y, visited, basin)
  return if visited[[x,y]]
  visited[[x, y]] = true
  basin << [[x, y]] unless map[y][x] == 9

  adj = adjacencies(x, y, map)
  unless adj.all? { |adj_x, adj_y| map[adj_y][adj_x] == 9 || visited[[adj_x, adj_y]] }
    adj.each do |adj_x, adj_y|
      explore_basin(map, adj_x, adj_y, visited, basin) if map[adj_y][adj_x] > map[y][x]
    end
  end
  basin
end

def adjacencies(x, y, map)
  [].tap do |adjacencies|
    [[0,1], [1,0], [0,-1], [-1, 0]].each do |dx, dy|
      if x + dx >= 0 && x + dx < map[0].length && y + dy >= 0 && y + dy < map.length
        adjacencies.append([x+dx, y+dy])
      end
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
