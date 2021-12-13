def main
  caves = {}
  File.readlines('./input.txt').map { |line| line.chomp.split('-') }.map do |a, b|
    caves[a] ||= []
    caves[b] ||= []
    caves[a] << b
    caves[b] << a
  end

  paths = []
  explore_cave("start", caves, [], paths)
  puts paths.count
end

def explore_cave(chamber, caves, path, paths)
  path << chamber
  if chamber == 'end'
    paths << path
  else
    caves[chamber].each do |next_chamber|
      unless (is_small?(next_chamber) && has_two_small_chambers?(path) && path.include?(next_chamber)) || next_chamber == 'start' && path.include?('start')
        explore_cave(next_chamber, caves, path.clone, paths)
      end
    end
  end
  paths
end

def is_small?(chamber)
  chamber.upcase != chamber
end

def has_two_small_chambers?(path)
  path.any? { |c| is_small?(c) && path.count(c) == 2 }
end

main if __FILE__ == $PROGRAM_NAME
