# remember to save before running
puts "Hello World from Ruby"

my_num = 25 # snake_case
my_bool = true # lowercase booleans
my_string = "Maria" # dynamically typed
my_num = 25 % 6

puts my_string
puts my_num

# puts adds newline at the end of a statement
# print has no newline
puts "Put this down"
print "Print this"
print " and this"
puts "This is not a new line"
puts 'but this is'.length()

puts "Maria".reverse().upcase()
puts "Maria".reverse().downcase()

var="test1"
puts var

puts 1 + '2'.to_i

puts "A" + 'B' + 'c'

puts 'a'.class

# guess = 'a'
# if guess.count("a-zA-Z") = 1:

test_word = 'abcdefg'
test_letter = 'f'
# test_word = test_word.split()
puts test_word

test_word.each_char.each_with_index do |c, i|
    if test_word[i] == test_letter
        puts i
    end
end

scope = 0
def scope_updator(scope)
    scope += 1
end

scope_updator(scope)
puts scope # still prints 0, not 1