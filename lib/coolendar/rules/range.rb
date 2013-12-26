module Coolendar
  class Range
    def initialize(from,to)
      @from = from
      @to = to
    end

    def match?(date)
      puts rule_range.to_a
      rule_range.any? { |rule| rule.match?(date) }
    end

    private 
    def rule_range
      (@from..@to)
    end
  end
end