def main
  puts File.foreach('./input.txt').map(&:to_i).each_cons(4).count { |x| x[1..3].sum > x[0..2].sum }
end

main if __FILE__ == $PROGRAM_NAME
