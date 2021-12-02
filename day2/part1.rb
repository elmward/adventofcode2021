def main
  pos = 0
  depth = 0
  File.readlines('./input.txt').map(&:split).each do |direction, dist|
    dist = dist.to_i
    case direction
    when 'forward'
      pos += dist
    when 'down'
      depth += dist
    when 'up'
      depth -= dist
    end
  end
  puts pos * depth
end

main if __FILE__ == $PROGRAM_NAME
