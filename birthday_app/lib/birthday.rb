require 'date'

class Birthday
  attr_accessor :name, :birthday

  def initialize
    @current_date = Date.today
  end

  def birthday_countdown
    (@current_date...birthday).count
  end 

  def message_generator
    if birthday_countdown == 0
      "Happy Birthday #{name}!"
    else 
      "Your birthday will be in #{birthday_countdown}, #{name}"


  end 
end