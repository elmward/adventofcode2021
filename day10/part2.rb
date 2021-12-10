DELIMITERS = {'(' => ')', '[' => ']', '{' => '}', '<' => '>'}
SCORES = {'(' => 1, '[' => 2, '{' => 3, '<' => 4}

def main
  incomplete_lines = File.readlines('./input.txt').map(&:chomp).select do |line|
    openers = []
    valid = true
    line.chars.each do |c|
      if DELIMITERS.keys.include?(c)
        openers.push c
      else
        opener = openers.pop
        next if DELIMITERS[opener] == c
        valid = false
      end
    end
    valid
  end

  scores = []
  incomplete_lines.each do |line|
    openers = []
    line.chars.each do |c|
      if DELIMITERS.keys.include?(c)
        openers.push c
      else
        opener = openers.pop
        next if DELIMITERS[opener] == c
      end
    end
    scores << openers.reverse.reduce(0) { |acc, c| (acc * 5) + SCORES[c] }
  end

  puts scores.sort[scores.length/2]
end

main if __FILE__ == $PROGRAM_NAME
