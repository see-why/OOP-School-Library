require_relative './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, specialization, name = 'Unknown')
    super(age, name, parent_permission: true)
    @specialization = specialization
  end

  def can_use_services
    true
  end
end
