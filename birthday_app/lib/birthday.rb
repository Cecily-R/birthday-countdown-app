require 'date'

class Birthday
  attr_accessor :name, :birthday_date

  def birthday_countdown
    (Date.parse(birthday_date) - current_date).to_i
  end 

  def message_generator
    if birthday_countdown == 0
      "Happy Birthday #{name}!"
    else 
      "Your birthday will be in #{birthday_countdown} days, #{name}"
    end 
  end 

  def current_date
    Date.today
  end
end