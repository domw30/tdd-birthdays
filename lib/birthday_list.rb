class BirthdayList

  def initialize
    @list = []
  end

  def add(name, date)
    @list.push({ name: name, birthday: date })
  end

  def display
    @list.each do |birthdays|
      puts "#{birthdays[:name]}: #{birthdays[:birthday]}"
    end
  end

end
