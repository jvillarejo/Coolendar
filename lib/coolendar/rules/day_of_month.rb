module Coolendar
  class DayOfMonth
    attr_reader :month, :day
    
    def initialize(month,day)
      @month = month
      @day = day
    end

    def match?(date)
      date.month == month && date.day == day
    end
  end
end