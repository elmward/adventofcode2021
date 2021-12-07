def main
  segments = File.readlines("./input.txt").map { |line| line.split(" -> ").map { |point| point.split(",").map(&:to_i) } }
  horizontal_segments = segments.filter { |segment| horizontal?(segment) }
  vertical_segments = segments.filter { |segment| vertical?(segment) }
  overlaps = {}

  # horizontal and vertical overlaps
  horizontal_segments.each do |h_segment|
    vertical_segments.each do |v_segment|
      min_y, max_y = [v_segment[0][1], v_segment[1][1]].sort
      min_x, max_x = [h_segment[0][0], h_segment[1][0]].sort
      if h_segment[0][1] <= max_y && h_segment[0][1] >= min_y && v_segment[0][0] <= max_x && v_segment[1][0] >= min_x
        x, y = v_segment[0][0], h_segment[0][1]
        overlaps[[x, y]] ||= 0
        overlaps[[x, y]] += 1
      end
    end
  end

  # horizontal/horizontal overlaps
  horizontal_segments.each_with_index do |h_segment, i|
    horizontal_segments[i+1..].each do |h_segment2|
      if h_segment[0][1] == h_segment2[0][1]
        min_x, max_x = [h_segment[0][0], h_segment[1][0]].sort
        min_x2, max_x2 = [h_segment2[0][0], h_segment2[1][0]].sort
        min_x_intersect = [min_x, min_x2].max
        max_x_intersect = [max_x, max_x2].min
        (min_x_intersect..max_x_intersect).each do |x|
          overlaps[[x, h_segment[0][1]]] ||= 0
          overlaps[[x, h_segment[0][1]]] += 1
        end
      end
    end
  end

  # vertical/vertical overlaps
  vertical_segments.each_with_index do |v_segment, i|
    vertical_segments[i+1..].each do |v_segment2|
      if v_segment[0][0] == v_segment2[0][0]
        min_y, max_y = [v_segment[0][1], v_segment[1][1]].sort
        min_y2, max_y2 = [v_segment2[0][1], v_segment2[1][1]].sort
        min_y_intersect = [min_y, min_y2].max
        max_y_intersect = [max_y, max_y2].min
        (min_y_intersect..max_y_intersect).each do |y|
          overlaps[[v_segment[0][0], y]] ||= 0
          overlaps[[v_segment[0][0], y]] += 1
        end
      end
    end
  end
  puts overlaps.count
end

def horizontal?(segment)
  segment[0][1] == segment[1][1]
end

def vertical?(segment)
  segment[0][0] == segment[1][0]
end

main if __FILE__ == $PROGRAM_NAME
