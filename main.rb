#!/usr/bin/env ruby
require_relative 'modules/appfunctions'
require 'pry'

class App
  include AppFunctions
  attr_reader :book_list, :people_list, :rental_list

  def initialize
    @book_list = []
    @people_list = []
    @rental_list = []
    process_user_choice
  end

  def start
    number = ''
    while number == ''
      puts "\nWelcome to the School Library App"
      puts "\n"
      puts 'Please choose an option by entering a number:'
      puts '1 - List all books'
      puts '2 - List all people'
      puts '3 - Create a person'
      puts '4 - Create a book'
      puts '5 - Create a rental'
      puts '6 - List all rentals for a given person id'
      puts '7 - Exit'
      number = gets.chomp.to_i
      number = '' unless number.is_a?(Numeric) && number.positive? && number <= 7
      puts 'Invalid selection' unless number != ''
    end
    number
  end

  def process_user_choice
    selection = start
    case selection
    when 1
      display_books
    when 2
      display_persons
    when 3
      create_person
    when 4
      create_book
    when 5
      add_rental
    when 6
      display_rentals
    else
      puts 'Closing library.....'
      return
    end
    process_user_choice
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
      puts 'Invalid selection' if book == ''
    end

    person = ''
    while person == ''
      puts 'Select a person from the following list by number (not id)'
      display_persons
      person_index = gets.chomp.to_i
      person = get_person(person_index)
      puts 'Invalid selection' if person == ''
    end

    date = validate_name('date')

    @rental_list.push(create_rental(date, book, person))
    puts "Rental created successfully\n"
  end
end

def main
  App.new
end

main
