module Coolendar
  class DayOfWeek

    attr_reader :day 

    def self.week_days
      @@week_days ||= [:monday,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday]
    end
    
    week_days.each do |day|
      send(:define_singleton_method, day) do
        self.new(day)
      end
    end

    def initialize(day)
      @day = day
    end

    def match?(date)
      method = (day.to_s + '?').to_sym

      date.send(method)
    end

    def succ
      result = DayOfWeek.new(next_day)
    end

    def ==(other)
      day == other.day
    end

    def next_day
      last_day? ? @@week_days.first : @@week_days[index + 1]
    end

    def last_day?
      day == @@week_days.last
    end

    private
    def index
      @@week_days.index(day)
    end
  end
end
