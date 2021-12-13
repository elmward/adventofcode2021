def main
  octopuses = File.readlines('./input.txt').map { |line| line.chomp.chars.map(&:to_i) }
  flashes = 0
  i = 0
  until octopuses.all? { |row| row.all? { |energy_level| energy_level == 0 } } do
    octopuses = octopuses.map { |row| row.map { |energy_level| energy_level + 1 } }

    do_all_flashes(octopuses)
    flashes += octopuses.sum { |row| row.count { |energy_level| energy_level == 0 } }
    i+=1
  end
  puts flashes
  puts i
end

def do_all_flashes(octopuses)
  flashes = 0
  octopuses.each_with_index do |row, y|
    row.each_with_index do |_, x|
      flashes += do_flashes(x, y, octopuses)
    end
  end
  flashes
end

def do_flashes(x, y, octopuses)
  flashes = 0
  if octopuses[y][x] >= 10
    flashes += 1
    octopuses[y][x] = 0
    adjacencies(x, y, octopuses).each do |adj_x, adj_y|
      octopuses[adj_y][adj_x] += 1 unless octopuses[adj_y][adj_x] == 0
      flashes += do_flashes(adj_x, adj_y, octopuses)
    end
  end
  flashes
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