def main
  puts File.foreach('./input.txt').map(&:to_i).each_cons(2).count { |prev, curr| curr > prev }
end

main if __FILE__ == $PROGRAM_NAME
