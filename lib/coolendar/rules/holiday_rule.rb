module Coolendar
  class HolidayRule
    attr_accessor :description

    def self.single_day(date,description='')
      set_description(description) { SingleDay.new(date) }
    end

    def self.week_day(week_day,description='')
      set_description(description) { WeekDay.send(week_day) }
    end

    def self.month_day(month,day,description='')
      set_description(description) { MonthDay.new(month,day) }
    end

    def self.range(from,to,description='')
      set_description(description) { Range.new(from,to) }
    end

    private
    def self.set_description(description, &rule_creation)
      rule = rule_creation.call
      rule.description = description
      rule
    end
  end
end