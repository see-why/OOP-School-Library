require_relative '../classes/book'
require_relative '../classes/student'
require_relative '../classes/teacher'
require_relative '../classes/rental'
require_relative './filefunctions'
require 'json'

module AppFunctions
  include FileFunctions
  def initialize
    @classroom = Classroom.new('Best')
  end

  def validate_number(kind_of_number)
    save = false
    while save != true
      print "#{kind_of_number.capitalize}: "
      age = gets.chomp.to_i
      save = age.is_a?(Numeric) && age.positive?
      puts "Invalid #{kind_of_number}" unless save
    end
    age
  end

  def validate_id
    save = false
    while save != true
      print 'ID of Person: '
      person_id = gets.chomp.to_i
      save = person_id.is_a?(Numeric) && person_id.positive?
      puts 'Invalid number' unless save
    end
    person_id
  end

  def validate_name(text)
    save = false
    while save != true
      print "#{text.capitalize}: "
      input = gets.chomp
      save = input != ''
      puts "Invalid #{text}" unless save
    end
    input
  end

  def validate_permission
    save = false
    while save != true
      print 'Has parent permission? [Y\N]: '
      answer = gets.chomp.upcase
      save = (answer == 'N') || (answer == 'Y')
      puts 'Invalid input' unless save
      answer = (answer != 'N') if save
    end
    answer
  end

  def create_student
    age = validate_number('age')
    name = validate_name('name')
    answer = validate_permission
    Student.new(age, @classroom, answer, name)
  end

  def create_teacher
    age = validate_number('age')
    name = validate_name('name')
    specialization = validate_name('specialization')
    Teacher.new(age, specialization, name)
  end

  def create_new_book
    title = validate_name('title')
    author = validate_name('author')
    Book.new(title, author)
  end

  def create_rental(date, book, person)
    Rental.new(date, book, person)
  end

  def empty_string?(obj)
    puts 'Invalid selection' if obj == ''
  end
end
