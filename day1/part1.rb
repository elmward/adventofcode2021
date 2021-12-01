def main
  puts File.foreach('./input.txt').map(&:to_i).each_cons(2).count { |x| x[1] > x[0] }
end

main if __FILE__ == $PROGRAM_NAME
