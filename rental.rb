class Rental
  def initialize(date, book, person)
    @date = date

    @book = book
    book.rentals << self

    @person = person
    person.rentals << self
  end

  attr_accessor :date
  attr_reader :book, :person
end
