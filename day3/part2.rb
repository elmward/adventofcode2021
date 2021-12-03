def main
  input = File.readlines('./input.txt').map(&:chomp)
  num_numbers = input.length

  valid_for_oxygen = input.clone
  valid_for_co2 = input.clone

  input.first.chars.each_with_index do |_, i|
    oxygen_ones_count = valid_for_oxygen.count { |line| line.chars[i].to_i == 1 }
    oxygen_zeroes_count = valid_for_oxygen.count - oxygen_ones_count

    co2_ones_count = valid_for_co2.count { |line| line.chars[i].to_i == 1 }
    co2_zeroes_count = valid_for_co2.count - co2_ones_count

    # TODO there's probably an enumerable that will bifurcate an array based on a block
    if oxygen_ones_count >= oxygen_zeroes_count
      valid_for_oxygen = valid_for_oxygen.filter { |val| val[i] == "1" } unless valid_for_oxygen.length == 1
    else
      valid_for_oxygen = valid_for_oxygen.filter { |val| val[i] == "0" } unless valid_for_oxygen.length == 1
    end

    if co2_ones_count >= co2_zeroes_count
      valid_for_co2 = valid_for_co2.filter { |val| val[i] == "0" } unless valid_for_co2.length == 1
    else
      valid_for_co2 = valid_for_co2.filter { |val| val[i] == "1" } unless valid_for_co2.length == 1
    end
  end
  puts valid_for_oxygen.first.to_i(2) * valid_for_co2.first.to_i(2)
end

main if __FILE__ == $PROGRAM_NAME
