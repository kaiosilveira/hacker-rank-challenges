input = [1, 3, 5, 5]

def miniMaxSum(arr)
  min = perform_all_but_one_sum(arr, arr.max)
  max = perform_all_but_one_sum(arr, arr.min)
  puts "#{min} #{max}"
end

def perform_all_but_one_sum(arr, except)
  clone = arr.clone
  clone.delete_at(clone.index(except))
  clone.reduce(&:+)
end

miniMaxSum(input)
