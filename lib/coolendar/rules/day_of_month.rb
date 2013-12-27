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

    def ==(other)
      month == other.month && day == other.day
    end

    def succ()
      DayOfMonth.new(next_date.month,next_date.day)
    end

    private
    def next_date
      date + 1 
    end

    def date
      Date.strptime("#{month}-#{day}",'%m-%d')
    end
  end
end