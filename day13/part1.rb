def main
  dots, instructions = File.read('./input.txt').split("\n\n")

  dots = dots.split.map { |dot| dot.chomp.split(",").map(&:to_i) }

  instructions.split("\n").each do |instr|
    instr = instr.chomp
    puts instr
    res = /fold along ([x|y])=(\d+)/.match(instr)
    axis = res[1] == "x" ? 0 : 1
    value = res[2].to_i

    moving_dots = dots.select { |dot| dot[axis] > value }
    moving_dots.each { |dot| dot[axis] = (2 * value) - dot[axis]  }
    dots += moving_dots
    dots = dots.uniq
    break
  end

  puts dots.size
end

main if __FILE__ == $PROGRAM_NAME
