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

  context '#birthday_today?' do 
    it 'assigns true if birthday countdown is 0' do 

    end 
  end
end 