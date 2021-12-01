def main
  puts File.foreach('./input.txt').map(&:to_i).each_cons(4).count { |x| x.last > x.first }
end

main if __FILE__ == $PROGRAM_NAME
