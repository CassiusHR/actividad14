a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]

suma = a.map { |x| x + 1 }
puts suma
to_float = a.map { |x| x.to_f }
puts to_float
to_string = a.map { |x| x.to_s }
puts to_string
rejected = a.reject { |x| x < 5 }
puts rejected
selected = a.select { |x| x > 5 }
puts selected
a_sum = a.inject(0){|sum,x| sum + x }
puts a_sum
group = a.group_by { |x| x.odd? }
puts group
group2 = a.group_by { |x| x > 6 }
puts group2
