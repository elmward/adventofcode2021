require 'set'

def main
  segments = File.readlines("./input.txt").map { |line| line.split(" -> ").map { |point| point.split(",").map(&:to_i) } }
  segments = segments.filter { |segment| vertical?(segment) || horizontal?(segment) }
  overlaps = Set.new

  segments.each_with_index do |segment1, i|
    segments[i+1..].each do |segment2|
      v_segments = [segment1, segment2].filter{ |segment| vertical?(segment) }
      h_segments = [segment1, segment2].filter{ |segment| horizontal?(segment) }
      if v_segments.any? && h_segments.any?
        v_segment, h_segment = v_segments.first, h_segments.first
        min_y, max_y = [v_segment[0][1], v_segment[1][1]].sort
        min_x, max_x = [h_segment[0][0], h_segment[1][0]].sort
        if h_segment[0][1] <= max_y && h_segment[0][1] >= min_y && v_segment[0][0] <= max_x && v_segment[1][0] >= min_x
          x, y = v_segment[0][0], h_segment[0][1]
          overlaps.add([x, y])
        end
      elsif v_segments.length == 2
        v_segment, v_segment2 = v_segments
        if v_segment[0][0] == v_segment2[0][0]
          min_y, max_y = [v_segment[0][1], v_segment[1][1]].sort
          min_y2, max_y2 = [v_segment2[0][1], v_segment2[1][1]].sort
          min_y_intersect = [min_y, min_y2].max
          max_y_intersect = [max_y, max_y2].min
          (min_y_intersect..max_y_intersect).each do |y|
            overlaps.add([v_segment[0][0], y])
          end
        end
      else
        h_segment, h_segment2 = h_segments
        if h_segment[0][1] == h_segment2[0][1]
          min_x, max_x = [h_segment[0][0], h_segment[1][0]].sort
          min_x2, max_x2 = [h_segment2[0][0], h_segment2[1][0]].sort
          min_x_intersect = [min_x, min_x2].max
          max_x_intersect = [max_x, max_x2].min
          (min_x_intersect..max_x_intersect).each do |x|
            overlaps.add([x, h_segment[0][1]])
          end
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
