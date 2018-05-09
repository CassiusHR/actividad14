nombres = ["Violeta", "Andino", "Clemente", "Javiera", "Paula", "Pia", "Ray"]

  names = nombres.select { |x| x.length >5 }
  puts names
  lowercase = nombres.map { |x| x.downcase }
  puts lowercase
  starts_p = nombres.select { |x| x.downcase.start_with?('p') }
  puts starts_p
  count = nombres.map { |x| x.length }
  puts count
  del_vowel = nombres.map { |x| x.gsub(/[aeiou]/, '') }
  puts del_vowel
