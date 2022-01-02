# Part one

def get_input(file)
  input = File.readlines(file).map(&:strip)
end

def get_corrupted_and_score(input)
  brackets = {
    '(' => ')',
    '[' => ']',
    '{' => '}',
    '<' => '>',
  }
  points = {
    ')' => 3,
    ']' => 57,
    '}' => 1197,
    '>' => 25137,
  }
  corrupted = []
  score = 0

  input.each do |line|
    expected = []
    line.chars.each do |char|
      if brackets[char]
        expected << brackets[char]
      elsif expected[-1] == char
        expected.pop
      else
        corrupted << line
        score += points[char]
        break
      end
    end
  end
  { corrupted: corrupted, score: score }
end

input = get_input('day_10.txt')
hash = get_corrupted_and_score(input)
score = hash[:score]

puts "Part one answer: #{ score }"

# Part two

def get_incomplete(input, corrupted)
  legal = input - corrupted
  incomplete = legal.reject { |line| line.count("([{<") ==  line.count(")]}>") }
end

def get_completion(line)
  brackets = {
    '(' => ')',
    '[' => ']',
    '{' => '}',
    '<' => '>'
  }
  completion = []

  line.chars.each do |char|
    if brackets[char]
      completion.unshift(brackets[char])
    else
      completion.shift
    end
  end
  completion
end

def get_score(completion)
  points = {
    ')' => 1,
    ']' => 2,
    '}' => 3,
    '>' => 4,
  }
  score = 0

  completion.each do |char|
    score *= 5
    score += points[char]
  end
  score
end

def get_total_scores(incomplete)
  scores = []
  incomplete.each do |line|
    completion = get_completion(line)
    score = get_score(completion)
    scores << score
  end
  scores
end

def get_middle_score(total_scores)
  sorted = total_scores.sort
  medium_idx = sorted.size / 2
  sorted[medium_idx] 
end

corrupted = hash[:corrupted]
incomplete = get_incomplete(input, corrupted)
total_scores = get_total_scores(incomplete)
middle_score = get_middle_score(total_scores)

puts "Part two answer: #{ middle_score }"