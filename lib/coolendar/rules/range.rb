module Coolendar
  class Range < HolidayRule
    def initialize(from,to)
      @from = from
      @to = to
    end

    def match?(date)
      rule_range.any? { |rule| rule.match?(date) }
    end

    private 
    def rule_range
      @from..@to
    end
  end
end