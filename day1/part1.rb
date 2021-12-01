def main
  input = File.readlines('./input.txt')
  prev = nil
  increased = 0
  input.map(&:to_i).each do |depth|
    if prev == nil
      prev = depth
      next
    end
    increased += 1 if depth > prev
    prev = depth
  end

  puts increased
end

main if __FILE__ == $PROGRAM_NAME
