class BirthdayList

  def initialize
    @list = []
  end

  def add(name, date)
    @list.push({ name: name, birthday: date })
  end
  
end
