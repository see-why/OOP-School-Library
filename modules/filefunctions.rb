module FileFunctions
  def save_data
    people_list = @people_list.each_with_index.map do |people, index|
      { 'class' => people.class, 'age' => people.age,
        'specialization' => (if people.class.to_s == 'Teacher'
                               people.specialization
                             end), 'parent_permission' => people.parent_permission, 'index' => index }
    end
    File.write('people_list.json', JSON.generate(people_list))
    book_list = @book_list.each_with_index.map do |book, index|
      { 'title' => book.title, 'author' => book.author, 'index' => index }
    end
    File.write('book_list.json', JSON.generate(book_list))
    rental_list = @rental_list.map do |rental|
      { 'date' => rental.date, 'book-index' => @book_list.index(rental.book),
        'person-index' => @people_list.index(rental.person) }
    end
    File.write('rental_list.json', JSON.generate(rental_list))
  end

  def load_people
    return [] unless File.exist?('people_list.json')

    raw_people_list = File.read('people_list.json')
    raw_people_list = JSON.parse(raw_people_list)
    arr = []
    raw_people_list.each do |person|
      if person['class'].to_s == 'Teacher'
        arr.push(Teacher.new(person['age'], person['specialization'],
                             person['name']))
      end
      if person['class'].to_s == 'Student'
        arr.push(Student.new(person['age'], @classroom, person['parent_permission'],
                             person['name']))
      end
    end
    arr
  end

  def load_books
    return [] unless File.exist?('book_list.json')

    raw_book_list = File.read('book_list.json')
    raw_book_list = JSON.parse(raw_book_list)
    arr = []
    raw_book_list.each do |book|
      arr.push(Book.new(book['title'], book['author']))
    end
    arr
  end

  def load_rentals
    return [] unless File.exist?('rental_list.json')

    raw_rental_list = File.read('rental_list.json')
    raw_rental_list = JSON.parse(raw_rental_list)
    arr = []
    raw_rental_list.each do |rental|
      arr.push(Rental.new(rental['date'], @book_list[rental['book-index']], @people_list[rental['person-index']]))
    end
    arr
  end
end
