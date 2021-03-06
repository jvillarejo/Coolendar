module Coolendar
  class SingleDay < HolidayRule
    include Comparable

    attr_reader :date

    def initialize(date)
      @date = date
    end

    def match?(date)
      @date == date
    end

    def succ
      SingleDay.new(date + 1)
    end

    def ==(other)
      @date == other.date
    end

    def <=>(other)
      date <=> other.date
    end

  end
end