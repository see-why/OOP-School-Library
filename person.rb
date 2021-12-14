class Person
  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id, :parent_permission

  def can_use_services?
    of_age? && @parent_permission # linters insisted on changing is_of_age to of_age
  end

  private

  def of_age?
    @age >= 18
  end
end
