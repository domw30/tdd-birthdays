require 'date'

class BirthdayList
  DATE_FORMAT = '%m-%d'

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

  def check_date
    @list.each do |birthdays|
      puts "#{birthdays[:name]} is #{age(birthdays)} today ! Happy Birthday #{birthdays[:name]} !" if today?(birthdays)
    end
  end

private

  def age(birthday)
    Time.now.year - Date.parse(birthday[:birthday]).year
  end

  def today?(birthday)
    birthday_date(birthday) == today
  end

  def birthday_date(birthday)
    Date.parse(birthday[:birthday]).strftime(DATE_FORMAT)
  end

  def today
    Time.now.strftime(DATE_FORMAT)
  end

end
