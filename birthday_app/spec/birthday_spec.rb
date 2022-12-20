require_relative ('../lib/birthday')

describe 'birthday' do 
  context '#birthday_countdown' do 
    it 'returns 27 for the number of days between current date and users birthday' do 
      birthday = Birthday.new
      expect(birthday).to receive(:current_date).and_return (Date.parse('2022-12-18'))
      birthday.birthday_date = '2023-01-14'
      expect(birthday.birthday_countdown).to eq 27
    end 

    it 'returns 0 for the number of days between current date and users birthday' do 
      birthday = Birthday.new
      expect(birthday).to receive(:current_date).and_return (Date.parse('2022-12-18'))
      birthday.birthday_date = '2022-12-18'
      expect(birthday.birthday_countdown).to eq 0
    end 
  end 

  context '#birthday_today?' do 
    it 'assigns true when birthday countdown is 0' do 
      birthday = Birthday.new 
      expect(birthday).to receive(:current_date).and_return (Date.parse('2022-12-18'))
      birthday.birthday_date = '2022-12-18'
      expect(birthday.birthday_today?).to eq true
    end 

    it 'assigns false when birthday countdown is greater than 0' do 
      birthday = Birthday.new 
      expect(birthday).to receive(:current_date).and_return (Date.parse('2022-12-18'))
      birthday.birthday_date = '2023-07-19'
      expect(birthday.birthday_today?).to eq false
    end 
  end
end 