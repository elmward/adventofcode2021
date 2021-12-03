def main
  epsilon = 0
  gamma = 0
  input = File.readlines('./input.txt').map(&:chomp)
  num_numbers = input.length

  input.first.chars.each_with_index do |_, i|
    ones_count = input.map { |line| line.chars.reverse[i].to_i }.sum

    if ones_count > (num_numbers / 2)
      epsilon += (2 ** i)
    else
      gamma += (2 ** i)
    end
  end

  puts epsilon * gamma
end

main if __FILE__ == $PROGRAM_NAME
