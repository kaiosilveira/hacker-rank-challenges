require_relative "./validate-bill-division"

def bonAppetit(bill, k, b)
  result = validate_bill_division(
    bill_items: bill,
    index_of_item_anna_refused_to_eat: k,
    bill_division_according_to_brian: b
  )

  puts result
end

samples = [
  { bill: [2, 4, 6], k: 2, b: 3 },
  { bill: [3, 10, 2, 9], k: 1, b: 12 },
]

samples.each { |sample| bonAppetit(sample[:bill], sample[:k], sample[:b]) }
