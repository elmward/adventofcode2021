def main
  template, input_rules = File.read('./input.txt').split("\n\n")
  template = template.chomp
  rules = {}.tap do |rules|
    input_rules.split("\n").map do |rule|
      pair, insertion = rule.chomp.split(' -> ')
      rules[pair] = insertion
    end
  end

  result = template
  10.times do
    result = result.chars.each_cons(2).reduce([]) do |acc, chars|
      a, b = chars[0], chars[1]
      pair = [a,b].join
      if acc.empty?
        acc << [a, rules[pair], b]
      else
        acc << [rules[pair], b]
      end
      acc
    end.join
  end

  elements = result.chars.uniq
  counts = {}.tap do |counts|
    elements.each do |element|
      counts[element] = result.count(element)
    end
  end

  puts counts.values.max - counts.values.min
end

main if __FILE__ == $PROGRAM_NAME
