require_relative '../classes/classroom'
require_relative '../classes/student'

describe Student do
  context 'Classroom class Test' do
    classroom1 = Classroom.new('math')
    classroom2 = Classroom.new('history')
    student1 = Student.new(15, classroom1, true)
    student2 = Student.new(15, classroom2, true)
    student3 = Student.new(15, classroom2, true)
    classroom1.add_student(student1)
    classroom2.add_student(student2)
    classroom2.add_student(student3)

    it 'initializes with the correct label' do
      expect(classroom1.label).to eql('math')
      expect(classroom2.label).to eql('history')
    end

    it 'contains the correct number of students' do
      expect(classroom1.students.size).to eql(1)
      expect(classroom2.students.size).to eql(2)
    end

    it 'can add new students' do
      classroom1.add_student(Student.new(12, classroom1, true))
      expect(classroom1.students.size).to eql(2)
    end
  end
end
