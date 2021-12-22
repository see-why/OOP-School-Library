require_relative '../classes/book'

describe Book do
  context 'Book class Test' do
    title = 'Sing all Loud'
    author = 'Ricky Martin'
    book = Book.new(title, author)

    it 'is an instance of class book' do
      expect(book).to be_an_instance_of(Book)
    end

    it 'checks title of book' do
      expect(book.title).to eq(title)
    end

    it 'checks author of book' do
      expect(book.author).to eq(author)
    end

    it 'should have empty rentals' do
      expect(book.rentals).to eq([])
    end
  end
end
