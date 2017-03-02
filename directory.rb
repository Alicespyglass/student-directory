@students = []

# header
def print_header
  puts "The students of Enders Academy"
  puts "-------------"
end

# an input
def name_cohort
  puts "What is the student name and their cohort? (separated by a comma, please write out full month)"
  input = gets.chomp.strip.split(", ") # strip removes space at beg and end
  @name = input[0].capitalize
    if input[1] != nil
     @cohort = input[1].capitalize
    else
      @cohort = "March"
    end
end


# an input
def hobby
  puts "What is their hobby?"
  @hobby = gets.chomp
end


# an input
def country
  puts "What is their country of birth?"
  @country = gets.chomp
end


# an input
def height
  puts "What is their height?"
  @height = gets.chomp
end


# headline input - how many - links to check
def input_students
  name_cohort
  hobby
  country
  height
  check
end


# new student - if no, move to print header
def newstudent
  puts "Would you like to add a new student? (Y/N)"
  answer = gets.chomp.capitalize
  if answer == "Y"
    input_students
  else print_header
  end
end


# check to confirm input - if yes, students
def check
  puts "#{@name}, #{@cohort}"
  puts "Is this correct? (Y/N to redo)"
  answer = gets.chomp.capitalize
    if answer == "Y"
      @students << {name: @name, cohort: @cohort, hobby: @hobby, country: @country, height: @height}
    else input_students
    end
  newstudent
end

# 1. Students printed with ordinal number before name
def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]}, #{student[:name]} cohort, hobby: #{student[:hobby]}, place of birth: #{student[:country]}, #{student[:height]} tall."
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

# 9. Student(s) messeage based on number
def print_footer(student)
  puts "-------------"
  if student.count > 1
    puts "Now we have #{student.count} great students."
  else
    puts "Now we have #{student.count} great student."
  end
end


def cohort_print(cohortm)
  @students.each do |student|
     if student[:cohort] == cohortm
      puts "#{student[:name]}, #{student[:cohort]} cohort."
     end
  end
end


def cohort_pick(students)
  coharr = students.map{ |student| student[:cohort]}.uniq
  puts "Which of the following cohort would you like to see the students for?"
  puts coharr
  cohortm = gets.chomp.capitalize
  cohort_print(cohortm)
end


input_students
print(@students)
print_if_letter(@students, "A")
print12(@students)
print_footer(@students)
cohort_pick(@students)
