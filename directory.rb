def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # get another name from the user
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
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end


# 2. Modify your program to only print the students
# whose name begins with a specific letter.
def print_if_letter(students, letter)
  puts "-------------"
  puts "The following students have names beginning with the letter #{letter}:"
  students.each_with_index do |student, i|
    if students[i][:name].start_with?(letter) # i indexes loop through hash
      puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
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
      puts "#{i + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
    else
    end
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
print_footer(students)
