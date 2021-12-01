def main
  input = File.readlines('./input.txt')
  prev = []
  increased = 0
  input.map(&:to_i).each do |depth|
    if prev.length < 3
      prev << depth
      next
    end
    curr = prev[1..2] << depth
    increased += 1 if curr.sum > prev.sum
    prev = curr
  end

  puts increased
end

main if __FILE__ == $PROGRAM_NAME
