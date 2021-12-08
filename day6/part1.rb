def main
  fish = File.read("./input.txt").split(",").map(&:to_i)
  80.times do
    num_fish = fish.count
    fish.each_with_index do |f, i|
      break if i == num_fish
      if f == 0
        fish[i] = 6
        fish << 8
      else
        fish[i] = f - 1
      end
    end
  end

  puts fish.count
end

main if __FILE__ == $PROGRAM_NAME
