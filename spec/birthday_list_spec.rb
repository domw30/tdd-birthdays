require 'birthday_list'
require 'timecop'

describe BirthdayList do

  describe '#add' do
    it 'adds a name and a birthday to the list' do
      birthday_list = BirthdayList.new
      expect(birthday_list.add('Dominic White', '30 January 1991')).to eq [{ name: 'Dominic White', birthday: '30 January 1991' }]
    end

    it 'adds two names and birthdays to the list' do
      birthday_list = BirthdayList.new
      birthday_list.add('Dominic White', '30 January 1991')
      expect(birthday_list.add('Benjamin White', '01 August 1989')).to eq [{ name: 'Dominic White', birthday: '30 January 1991'}, { name: 'Benjamin White', birthday: '01 August 1989' }]
    end
  end

  describe '#display' do
    it 'displays all names and birthdays on the list' do
      birthday_list = BirthdayList.new
      birthday_list.add('Dominic White', '30 January 1991')
      birthday_list.add('Benjamin White', '01 August 1989')
      expect { birthday_list.display }.to output("Dominic White: 30 January 1991\nBenjamin White: 01 August 1989\n").to_stdout
    end
  end

  describe '#check_date' do
    it 'checks date for birthdays today' do
      Timecop.freeze(Time.parse('16 July 2019')) do
        birthday_list = BirthdayList.new
        birthday_list.add('Dominic White', '30 January 1991')
        birthday_list.add('Benjamin White', '01 August 1989')
        birthday_list.add('Bob Jones', '16 July 1999')
        expect { birthday_list.check_date }.to output("Bob Jones is 20 today ! Happy Birthday Bob Jones !\n").to_stdout
      end
    end
  end
end
