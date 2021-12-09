def main
  outputs = File.readlines('./input.txt').flat_map { |line| line.chomp.split(" | ").last.split }
  puts outputs.count { |output| [2, 3, 4, 7].include?(output.length) }
end

main if __FILE__ == $PROGRAM_NAME
