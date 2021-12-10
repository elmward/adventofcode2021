DELIMITERS = {'(' => ')', '[' => ']', '{' => '}', '<' => '>'}

def main
  score = 0
  File.readlines('./input.txt').each do |line|
    openers = []
    line.chars.each do |c|
      if DELIMITERS.keys.include?(c)
        openers.push c
      else
        opener = openers.pop
        next if DELIMITERS[opener] == c
        case c
        when ')'
          score += 3
        when ']'
          score += 57
        when '}'
          score += 1197
        when '>'
          score += 25137
        end
      end
    end
  end
  puts score
end

main if __FILE__ == $PROGRAM_NAME
