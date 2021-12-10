DELIMITERS = {'(' => ')', '[' => ']', '{' => '}', '<' => '>'}
SCORES = {'(' => 1, '[' => 2, '{' => 3, '<' => 4}

def main
  scores = []
  File.readlines('./input.txt').map(&:chomp).each do |line|
    openers = []
    valid = true
    line.chars.each do |c|
      if DELIMITERS.keys.include?(c)
        openers.push c
      elsif DELIMITERS[openers.pop] != c
        valid = false
        break
      end
    end

    if valid
      scores << openers.reverse.reduce(0) { |acc, c| (acc * 5) + SCORES[c] }
    end
  end

  puts scores.sort[scores.length/2]
end

main if __FILE__ == $PROGRAM_NAME
