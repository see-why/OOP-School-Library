class Book
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  attr_accessor :title, :author
  attr_reader :rentals

  def add_rental(date, person)
    Rental.new(date, self, person)
  end
end
