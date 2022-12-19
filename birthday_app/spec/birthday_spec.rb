require_relative ('../lib/birthday')

describe 'birthday' do 
  context '#birthday_countdown' do 
    it 'returns the number of days between current date and users birthday' do 
      birthday = Birthday.new
      expect(birthday).to receive(:current_date).and_return (Date.parse('2022-12-18'))
      birthday.birthday_date = '2023-01-14'
      expect(birthday.birthday_countdown).to eq 27
    end 
  end 

  context '#message_generator' do 
    it 'returns Happy Birthday message' do 
      birthday = Birthday.new
      expect(birthday).to receive(:current_date).and_return (Date.parse('2022-12-18'))
      birthday.name = 'Jasmin'
      birthday.birthday_date = '2022-12-18'

      expect(birthday.message_generator).to eq 'Happy Birthday Jasmin!'
    end 

    it 'returns birthday countdown message' do 
      birthday = Birthday.new
      expect(birthday).to receive(:current_date).twice.and_return (Date.parse('2022-12-18'))
      birthday.name = 'Rory'
      birthday.birthday_date = '2023-01-14'

      expect(birthday.message_generator).to eq 'Your birthday will be in 27 days, Rory'
    end 
  end 
end 