module Coolendar
  class DayOfWeek
    include Comparable

    def self.week_days
      @@week_days ||= [:monday,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday]
    end
    
    week_days.each_with_index do |day,index|
      send(:define_singleton_method, day) do
        self.new(index)
      end
    end

    def initialize(index)
      @index = index
    end

    def match?(date)
      method = (day.to_s + '?').to_sym

      date.send(method)
    end

    def day
      @@week_days[index % 7]
    end

    def succ
      result = DayOfWeek.new(next_index)
    end

    def next_day
      succ.day
    end

    def ==(other)
      day == other.day
    end

    def <=>(other)
      index <=> other.index
    end

    def last_day?
      day == @@week_days.last
    end

    protected
    def index
      @index
    end

    def next_index
      index + 1
    end
  end
end
