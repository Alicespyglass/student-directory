# 5. Add more information: hobbies, country of birth,
# height, etc.
def input_students
  # create an empty array
  students = []
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice when asked for a new name"
  # get the first name
  puts "What is their name?"
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "What is their hobby?"
    hobby = gets.chomp
    puts "What is their country of birth?"
    country = gets.chomp
    puts "What is their height?"
    height = gets.chomp
    # add the student hash to the array
    students << {name: name, cohort: :november, hobby: hobby, country: country, height: height}
    puts "Now we have #{students.count} students"
    # get another name from the user
    puts "What is their name?"
    name = gets.chomp
  end
  # return the array of students
  students
end


def print_header
  puts "The students of Enders Academy"
  puts "-------------"
end


# 1. Students printed with ordinal number before name
def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(60)
  end
end


# 2. Modify your program to only print the students
# whose name begins with a specific letter.
def print_if_letter(students, letter)
  puts "-------------"
  puts "The following students have names beginning with the letter #{letter}:"
  students.each_with_index do |student, i|
    if students[i][:name].start_with?(letter) # i indexes loop through hash
      puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(60)
    else
    end
  end
end


# 3. Modify your program to only print the students
# whose name is shorter than 12 characters.
def print12(students)
  puts "-------------"
  puts "These students have names which is shorter than 12 characters"
  students.each_with_index do |student, i|
    if students[i][:name].delete(' ').length < 12 # delete white spaces, check length
      puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)".center(60)
    else
    end
  end
end

# 4a. Rewrite the each() method that prints all students
# using WHILE
def print_while(students)
  puts "-------------"
  puts "Students by print_while"
  i = 1   # set count (index)
  while i <= students.count   # while count is <= length of array
    puts "#{i}. #{students[i-1][:name]} (#{students[i-1][:cohort]} cohort)".center(60)
    i += 1
  end
end

# 4B. Rewrite the each() method that prints all students
# using UNTIL
def print_until(students)
  puts "-------------"
  puts "Students by print_until"
  i = 1   # set count (index)
  until i > students.count   # while count is <= length of array
    output = "#{i}. #{students[i-1][:name]} (#{students[i-1][:cohort]} cohort)"
    puts output.center(60)
    i += 1
  end
end

def print_footer(names)
  puts "-------------"
  puts "Overall, we have #{names.count} great students"
end


# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_if_letter(students, "A")
print12(students)
print_while(students)
print_until(students)
print_footer(students)
