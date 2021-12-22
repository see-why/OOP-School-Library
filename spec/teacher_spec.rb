require_relative '../classes/teacher'

describe Student do
  context 'Teacher class Test' do
    age = 45
    specialization = 'Software testing'
    teacher1 = Teacher.new(age, specialization)
    teacher2 = Teacher.new(age * 2, specialization, 'Roger')
    teacher3 = Teacher.new(1, specialization, 'Roger')

    it 'is an instance of class Student' do
      expect(teacher1).to be_an_instance_of(Teacher)
    end

    it 'initialized with the correct variables including placeholders' do
      expect(teacher1.name).to eql('Unknown')
      expect(teacher2.name).to eql('Roger')
      expect(teacher1.age).to eql(45)
      expect(teacher2.age).to eql(90)
      expect(teacher1.specialization).to eql(specialization)
      expect(teacher2.specialization).to eql(specialization)
    end

    it 'always return true, for the can_use_services method' do
      expect(teacher3.can_use_services).to eql(true)
    end
  end
end
