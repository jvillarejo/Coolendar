module Coolendar
  class Calendar
    def initialize
      @rules = []
    end

    def add_holiday_rule(holiday_rule)
      @rules << holiday_rule
      self
    end

    def is_holiday(day)
      @rules.any? { |rule| rule.match?(day) }
    end

    def number_of_rules
      @rules.size
    end

    def get_holiday(day)
      raise NoHolidayFoundError.new unless is_holiday(day)
      
      @rules.find { |rule| rule.match?(day) }.description
    end
  end
end