def main
  crabs = File.read('./input.txt').split(',').map(&:to_i)

  best_position = (crabs.min..crabs.max).map do |pos|
    fuel_consumption = crabs.sum { |crab| (crab - pos).abs }
    [pos, fuel_consumption]
  end.min_by { |pos, fuel| fuel }

  puts best_position[1]
end

main if __FILE__ == $PROGRAM_NAME
