#!/usr/bin/env ruby
require_relative './classes/app'

# rubocop:disable Metrics/MethodLength, Metrics/CyclomaticComplexity
def main
  # rubocop:enable Metrics/MethodLength, Metrics/CyclomaticComplexity
  @app = App.new

  number = ''
  while number != 7
    puts "\nWelcome to the School Library App\n"
    puts "Please choose an option by entering a number:\n1 - List all books\n2 - List all people\n3 - Create a person\n"
    puts "4 - Create a book\n5 - Create a rental\n6 - List all rentals for a given person id\n7 - Exit\n"
    number = gets.chomp.to_i

    case number
    when 1
      @app.display_books
    when 2
      @app.display_persons
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.add_rental
    when 6
      @app.display_rentals
    when 7
      puts 'Closing library.....'
    else
      puts 'Invalid input'
    end
  end
end

main
