class SingleDay

  def initialize(date)
    @date = date
  end

  def match?(date)
    @date == date
  end
end