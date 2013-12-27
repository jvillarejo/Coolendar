module Coolendar
  class Range
    def initialize(from,to)
      @from = from
      @to = to
    end

    def match?(date)
      rule_range.any? { |rule| rule.match?(date) }
    end

    private 
    def rule_range
      range = []
      range << @from      
      
      current = @from.succ 
      while current != @to do
        range << current
        current = current.succ
      end
      range << @to
    end
  end
end