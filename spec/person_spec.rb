require_relative '../classes/person'
require_relative '../classes/book'

describe Person do
  context 'Person class Test' do
    age = 16
    name = 'ricky martin'
    person = Person.new(age, name, parent_permission: false)
    book = Book.new('Jump', 'Sam')

    it 'is an instance of class Person' do
      expect(person).to be_an_instance_of(Person)
    end

    it 'checks age of Person' do
      expect(person.age).to eq(age)
    end

    it 'validates name of Person' do
      expect(person.validate_name).not_to eq(name)
    end

    it 'checks Person can use services' do
      expect(person.can_use_services?).to eq(false)
    end

    it 'should have empty rentals' do
      expect(person.rentals).to eq([])
    end

    it 'should have one rental' do
      person.add_rental('2021-12-01', book)
      expect(person.rentals.size).to eq(1)
    end
  end
end
