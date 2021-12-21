require_relative '../classes/book'
require_relative '../classes/student'
require_relative '../classes/teacher'
require_relative '../classes/rental'
require 'json'

module AppFunctions
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

  def save_data
    File.write('people_list.json', JSON.generate(@people_list))
    File.write('book_list.json', JSON.generate(@book_list))
    File.write('rental_list.json', JSON.generate(@rental_list))
  end

  def load_people
    return [] unless File.exist?('people_list.json')

    raw_people_list = File.read('people_list.json')
    JSON.parse(raw_people_list)
  end

  def load_books
    return [] unless File.exist?('book_list.json')

    raw_book_list = File.read('book_list.json')
    JSON.parse(raw_book_list)
  end

  def load_rentals
    return [] unless File.exist?('rental_list.json')

    raw_rental_list = File.read('rental_list.json')
    JSON.parse(raw_rental_list)
  end
end
