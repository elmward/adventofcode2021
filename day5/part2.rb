def main
  segments = File.readlines("./input.txt").map { |line| line.split(" -> ").map { |point| point.split(",").map(&:to_i) } }
  grid = Hash.new(0)
  segments.each do |seg|
    x1, y1 = seg[0][0], seg[0][1]
    x2, y2 = seg[1][0], seg[1][1]

    x_delta = if x1 == x2
                0
              elsif x1 < x2
                1
              else
                -1
              end
    y_delta = if y1 == y2
                0
              elsif y1 < y2
                1
              else
                -1
              end
    loop do
      grid[[x1, y1]] += 1
      x1 += x_delta
      y1 += y_delta
      if x1 == x2 && y1 == y2
        grid[[x1, y1]] += 1
        break
      end
    end
  end

  puts grid.count { |_, v| v >= 2 }
end

main if __FILE__ == $PROGRAM_NAME
