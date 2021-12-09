def main
  map = File.readlines('./input.txt').map { |line| line.chomp.chars.map(&:to_i) }
  low_points = []
  (0..map[0].length-1).each do |x|
    (0..map.length-1).each do |y|
      adjacencies = []
      [[0,1], [1,0], [0,-1], [-1, 0]].each do |dx, dy|
        if x + dx >= 0 && x + dx < map[0].length && y + dy >= 0 && y + dy < map.length
          adjacencies << map[y+dy][x+dx]
        end
      end
      low_points << map[y][x] if adjacencies.all? { |height| height > map[y][x] }
    end
  end

  puts low_points.map { |x| x+1 }.sum
end

main if __FILE__ == $PROGRAM_NAME
