def get_divisible_sum_pairs(arr:, k:)
  pairs = []

  (0..arr.size-1).each do |i|
    (0..arr.size-1).each do |j|
      pairs << [arr[i], arr[j]] if i < j && (arr[i] + arr[j]).remainder(k) == 0
    end
  end

  pairs.size
end
