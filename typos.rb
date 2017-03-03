=begin
Main learnings
- do not use actual functions as variable or method names e.g. print
- # to comment out comments (not %)
- watch out for "s" at the end of commands e.g. puts, print, gets
- empty? - watch out that question marks are part of commands
- string interpolation is #{}
- hash structure - {:key => value, :key => :default value}
=end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array # t[%->#]
  students = [] # {}
  # get the first name # t[%->#]
  name = gets.chomp # space
  # while the name is not empty, repeat this code # t[%->#]
  while !name.empty? do # when
  # add the student hash to the array # t[%->#]
  students << {:name => name, :cohort => :november} # double <
  puts "Now we have #{students.count} students"
  # get another name from the user # t[%->#]
  name = gets.chomp
  end
  # return the array of students # t[%->#]
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_name(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  print "Overall, we have #{students.count} great students"
end


students = input_students
print_header
print_name(students) # don't use a command as a variable / function name!!!
print_footer(students)
