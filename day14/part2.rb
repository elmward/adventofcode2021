def main
  template, input_rules = File.read('./input.txt').split("\n\n")
  template = template.chomp
  rules = {}.tap do |rules|
    input_rules.split("\n").map do |rule|
      pair, insertion = rule.chomp.split(' -> ')
      rules[pair.chars] = insertion
    end
  end

  element_counts = Hash.new(0).tap do |element_counts|
    template.chars.each { |c| element_counts[c] += 1 }
  end

  pair_counts = Hash.new(0).tap do |pair_counts|
    template.chars.each_cons(2) do |a, b|
      pair_counts[[a,b]] += 1
    end
  end

  40.times do
    pair_counts = Hash.new(0).tap do |new_counts|
      pair_counts.each do |pair, old_count|
        new_char = rules[pair]
        if new_char
          new_counts[[pair[0], new_char]] += old_count
          new_counts[[new_char, pair[1]]] += old_count
          element_counts[new_char] += old_count
        end
      end
    end
  end

  puts element_counts.values.max - element_counts.values.min
end

main if __FILE__ == $PROGRAM_NAME
