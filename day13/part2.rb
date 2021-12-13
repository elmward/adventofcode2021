require 'set'

def main
  dots, instructions = File.read('./input.txt').split("\n\n")

  dots = dots.split.map { |dot| dot.chomp.split(",").map(&:to_i) }

  instructions.split("\n").each do |instr|
    instr = instr.chomp
    res = /fold along ([x|y])=(\d+)/.match(instr)
    axis = res[1] == "x" ? 0 : 1
    value = res[2].to_i

    moving_dots = dots.select { |dot| dot[axis] > value }
    moving_dots.each { |dot| dot[axis] = (2 * value) - dot[axis]  }
    dots += moving_dots
    dots = dots.uniq
  end

  # borrowed from https://stackoverflow.com/questions/10320297/plot-points-and-rectangles-in-ruby
  File.open('./output.svg', 'wb').write(
    <<~ENDSVG
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="-100 -100 200 200">
    #{dots.map{ |x,y| "<circle cx='#{x}' cy='#{y}' r='1' />" }.join("\n")}
    #</svg>
    ENDSVG
  )
end

main if __FILE__ == $PROGRAM_NAME
