require_relative '../modules/appfunctions'
require 'pry'

class App
  include AppFunctions
  attr_reader :book_list, :people_list, :rental_list

  def initialize
    @book_list = []
    @people_list = []
    @rental_list = []
  end

  def person_created
    puts "Person created successfully\n"
  end

  def create_person
    print 'Do you want to create a Student (1) or a Teacher (2)? '
    print '[input the number]: '
    number = gets.chomp.to_i

    if number.is_a?(Numeric) && number.positive? && number <= 2
      case number
      when 1
        @people_list.push(create_student)
        person_created
      when 2
        @people_list.push(create_teacher)
        person_created
      end
    else
      puts 'Invalid selection'
      create_person
    end
  end

  def create_book
    @book_list.push(create_new_book)
    puts "Book created successfully\n"
  end

  def display_rentals
    person_id = validate_id
    person = get_person_with_id(person_id)

    puts 'RENTALS:'
    if person != ''
      person.rentals.each_with_index do |rental, _i|
        puts "Date: #{rental.date}, Book: '#{rental.book.title}', Author: '#{rental.book.author}'" unless rental.nil?
      end
    end
    puts "\n"
  end

  def display_books
    puts 'BOOKS:'
    @book_list.each_with_index do |book, i|
      puts "(#{i}) Title: #{book.title}, Author: #{book.author}" unless book.nil?
    end
    puts "\n"
  end

  def get_book(id)
    specific_book = ''
    @book_list.each_with_index do |book, i|
      specific_book = book if i == id
    end
    specific_book
  end

  def display_persons
    puts 'PEOPLE:'
    @people_list.each_with_index do |person, i|
      puts "(#{i}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}" unless person.nil?
    end
    puts "\n"
  end

  def get_person(index)
    specific_person = ''
    @people_list.each_with_index do |person, i|
      specific_person = person if i == index
    end
    specific_person
  end

  def get_person_with_id(person_id)
    specific_person = ''
    @people_list.each do |person|
      specific_person = person if person.id == person_id
    end
    specific_person
  end

  def add_rental
    book = ''
    while book == ''
      puts 'Select a book from the following list by number'
      display_books
      book_id = gets.chomp.to_i
      book = get_book(book_id)
      empty_string?(book)
    end

    person = ''
    while person == ''
      puts 'Select a person from the following list by number (not id)'
      display_persons
      person_index = gets.chomp.to_i
      person = get_person(person_index)
      empty_string?(person)
    end

    date = validate_name('date')

    @rental_list.push(create_rental(date, book, person))
    puts "Rental created successfully\n"
  end
end
