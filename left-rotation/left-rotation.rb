def perform_left_rotation(d, arr)
  (0..arr.size - 1).map { |n| arr[(n + d) % arr.size] }
end
