def staircase(n)
  sequence = (0...n).to_a
  sequence.reverse.each do |n|
    puts draw(n - 1, ' ') + draw(sequence.size - n - 1, '#')
  end
end

def draw(n, token)
  (0..n).to_a.map { |n| token }.join('')
end

staircase(20)