def main
  input = File.read("./input.txt").split("\n\n")

  numbers = input[0].chomp.split(",")

  boards = input[1..].map { |board| board.split("\n").map { |line| line.split.map { |x| [x, false] } } }
  bingoed_boards = []

  numbers.each do |num|
    boards.each_with_index do |board, i|
      unless bingoed_boards.include?(i)
        board.each do |line|
          pos = line.map(&:first).find_index(num)
          if pos
            line[pos] = [num, true]
          end
        end

        if bingo?(board)
          bingoed_boards << i
          if bingoed_boards.length == boards.length
            unmarked = board.sum { |line| line.reject { |x| x[1] }.map { |x| x[0].to_i }.sum }
            puts num.to_i * unmarked
            return
          end
          next
        end
      end
    end
  end
end

def bingo?(board)
  row_bingo = board.any? do |line|
    line.all? { |_, marked| marked }
  end
  column_bingo = board.first.each_with_index.any? do |_, i|
    board.all? { |line| line[i][1] }
  end

  row_bingo || column_bingo
end

main if __FILE__ == $PROGRAM_NAME
