require_relative ('../lib/birthday')

describe 'birthday' do 
  context '#birthday_countdown' do 
    it 'returns the number of days between current date and users birthday' do 
      birthday = Birthday.new
      birthday.birthday_date = '2023-01-14'

      expect(birthday.birthday_countdown).to eq 26
    end 
  end 

  context '#message_generator' do 
    it 'returns Happy Birthday message' do 
      birthday = Birthday.new
      birthday.name = 'Jasmin'
      birthday.birthday_date = '2022-12-19'

      expect(birthday.message_generator).to eq 'Happy Birthday Jasmin!'
    end 

    it 'returns birthday countdown message' do 
      birthday = Birthday.new
      birthday.name = 'Rory'
      birthday.birthday_date = '2023-01-14'

      expect(birthday.message_generator).to eq 'Your birthday will be in 26 days, Rory'
    end 
  end 
end 