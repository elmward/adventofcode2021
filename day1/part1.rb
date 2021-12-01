def main
  input = File.readlines('./input.txt')
  puts input.map(&:to_i).each_cons(2).count { |x| x[1] > x[0] }
end

main if __FILE__ == $PROGRAM_NAME
