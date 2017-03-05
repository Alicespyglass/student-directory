@students = []

# Interactive Menu
def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end


# 1. print the menu and ask the user what to do
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end


def show_students
  print_header
  print_name(@students)
  print_footer(@students)
end


def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again?"
  end
end


# header
def print_header
  puts "The students of Enders Academy"
  puts "-------------"
end

# an input
def name_cohort
  puts "What is the student name and their cohort? (separated by a comma, please write out full month)"
  input = gets.chomp.strip.split(", ") # strip removes space at beg and end
  @name = input[0]
    if input[1] != nil
     @cohort = input[1]
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
  #hobby
  #country
  #height
  check
end


# new student - if no, move to print header
def newstudent
  puts "Would you like to add a new student? (Y/N)"
  answer = gets.chomp.capitalize
  if answer == "Y"
    input_students
  else interactive_menu
  end
end


# check to confirm input - if yes, students
def check
  puts "#{@name}, #{@cohort}"
  puts "Is this correct? (Y/N to redo)"
  answer = gets.chomp.capitalize
    if answer == "Y"
      @students << {name: @name, cohort: @cohort} #, hobby: @hobby, country: @country, height: @height}
    else input_students
    end
  newstudent
end


# 1. Students printed with ordinal number before name
# 12. Only print if not an empty list
def print_name(students)
  if students[0][:name] != nil
    students.each_with_index do |student, index|
      puts "#{index + 1}. #{student[:name]}, #{student[:cohort]} cohort."# hobby: #{student[:hobby]}, place of birth: #{student[:country]}, #{student[:height]} tall."
    end
  else
    puts "There are currently no students in the directory."
    exit(0)
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

def save_students
  # pen the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    #hobby country height
    student_data = [student[:name], student[:cohort]]#, student[:hobby], student[:country], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu
