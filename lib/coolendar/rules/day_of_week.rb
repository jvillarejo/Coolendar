class DayOfWeek

  [:monday,:tuesday,:wednesday,:thursday,:friday,:saturday,:sunday].each do |day_of_week|
    send(:define_singleton_method, day_of_week) do
      self.new(day_of_week)
    end
  end

  def initialize(day_of_week)
    @day_of_week = day_of_week
  end

  def match?(date)
    method = (@day_of_week.to_s + '?').to_sym

    date.send(method)
  end
end