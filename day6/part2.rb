def main
  fishes = Array.new(9, 0).tap do |fishes|
    File.read("./input.txt").split(",").map(&:to_i).tally.each do |timer, count|
      fishes[timer] = count
    end
  end

  256.times do
    new_fishes = fishes.shift
    fishes[6] += new_fishes
    fishes[8] = new_fishes
  end

  puts fishes.sum

end

main if __FILE__ == $PROGRAM_NAME
