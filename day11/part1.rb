def main
  octopuses = File.readlines('./input.txt').map { |line| line.chomp.chars.map(&:to_i) }
  flashes = 0
  100.times do
    octopuses = octopuses.map { |row| row.map { |energy_level| energy_level + 1 } }

    do_all_flashes(octopuses)
    flashes += octopuses.sum { |row| row.count { |energy_level| energy_level == 0 } }
  end
  puts flashes
end

def do_all_flashes(octopuses)
  octopuses.each_with_index do |row, y|
    row.each_with_index do |_, x|
      do_flashes(x, y, octopuses)
    end
  end
end

def do_flashes(x, y, octopuses)
  if octopuses[y][x] >= 10
    octopuses[y][x] = 0
    adjacencies(x, y, octopuses).each do |adj_x, adj_y|
      octopuses[adj_y][adj_x] += 1 unless octopuses[adj_y][adj_x] == 0
      do_flashes(adj_x, adj_y, octopuses)
    end
  end
end

def adjacencies(x, y, map)
  [].tap do |adjacencies|
    (-1..1).each do |dx|
      (-1..1).each do |dy|
        next if [dx, dy] == [0, 0]
        if x + dx >= 0 && x + dx < map[0].length && y + dy >= 0 && y + dy < map.length
          adjacencies.append([x+dx, y+dy])
        end
      end
    end
  end
end

main if __FILE__ == $PROGRAM_NAME
