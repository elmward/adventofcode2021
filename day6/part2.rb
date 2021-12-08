def main
  fishes = File.read("./input.txt").split(",").map(&:to_i).tally

  256.times do
    new_fishes = Hash.new(0)
    fishes.each do |timer, count|
      if timer == 0
        new_fishes[6] += count
        new_fishes[8] += count
      else
        new_fishes[timer-1] += count
      end
    end
    fishes = new_fishes
  end

  puts fishes.sum { |_, v| v }

end

main if __FILE__ == $PROGRAM_NAME
