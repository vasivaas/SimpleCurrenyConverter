require_relative  'main'

start = true

while start
  print 'input your dollar amount -  '
  amount = gets.to_i
  puts Converter.new(amount).convert!
  print 'Do you want to continue? input "y" if yes or "n" if no -  '
  tmp = gets.chomp
  if tmp == "n"
    start = false
  end
end
