class Corrector
  def correct_name(name)
    name = name.capitalize
    length = name.size
    name = name[0, 10] if length > 10
    name
  end
end
