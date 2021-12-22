require_relative '../classes/rental'
require_relative '../classes/book'
require_relative '../classes/teacher'

describe Rental do
  context 'Rental class Test' do
    date = '2021-05-02'
    book = Book.new('Jam Jam', 'Peter')
    person = Teacher.new(50, 'Drugs', 'Matthew')
    rental = Rental.new(date, book, person)

    it 'is instance of rental' do
      expect(rental).to be_an_instance_of(Rental)
    end

    it 'check book is book' do
      expect(rental.book).to eql(book)
    end

    it 'check person is person' do
      expect(rental.person).to eql(person)
    end

    it 'check book rental is rental' do
      expect(book.rentals[0]).to eql(rental)
    end

    it 'check person rental is rental' do
      expect(person.rentals[0]).to eql(rental)
    end
  end
end
