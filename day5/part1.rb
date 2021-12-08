def main
  segments = File.readlines("./input.txt").map { |line| line.split(" -> ").map { |point| point.split(",").map(&:to_i) } }
  grid = Hash.new(0)
  segments.each do |seg|
    x1, y1 = seg[0][0], seg[0][1]
    x2, y2 = seg[1][0], seg[1][1]
    if y1 == y2
      min_x, max_x = [x1, x2].sort
      (min_x..max_x).each do |x|
        grid[[x, y1]] += 1
      end
    elsif x1 == x2
      min_y, max_y = [y1, y2].sort
      (min_y..max_y).each do |y|
        grid[[x1, y]] += 1
      end
    end
  end

  puts grid.count { |k, v| v >= 2 }
end

main if __FILE__ == $PROGRAM_NAME
