require_relative '../classes/student'
require_relative '../classes/classroom'

describe Student do
  context 'Student class Test' do
    age = 15
    classroom = 'test classroom'
    student1 = Student.new(age, classroom, false)
    student2 = Student.new(age, classroom, true, 'Abby')

    it 'is an instance of class Student' do
      expect(student1).to be_an_instance_of(Student)
    end

    it 'initialized with the correct variables including placeholders' do
      expect(student1.name).to eql('Unknown')
      expect(student2.name).to eql('Abby')
      expect(student1.age).to eql(15)
      expect(student2.age).to eql(15)
      expect(student1.parent_permission).to eql(false)
      expect(student2.parent_permission).to eql(true)
      expect(student1.classroom).to eql(classroom)
      expect(student2.classroom).to eql(classroom)
    end

    it 'expects method play hooky to return ¯\(ツ)/¯' do
      expect(student1.play_hooky).to eql("¯\(ツ)/¯")
    end
  end
end
