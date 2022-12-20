# frozen_string_literal: true

require 'date'

class Birthday
  attr_accessor :name, :birthday_date

  def birthday_countdown
    (Date.parse(birthday_date) - current_date).to_i
  end

  def birthday_today?
    birthday_countdown.zero?
  end

  private

  def current_date
    Date.today
  end
end
