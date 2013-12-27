require 'date'
require 'coolendar/calendar'
require 'coolendar/rules/holiday_rule'
require 'coolendar/rules/single_day'
require 'coolendar/rules/day_of_week'
require 'coolendar/rules/day_of_month'
require 'coolendar/rules/range'

module Coolendar

  class NoHolidayFoundError< StandardError; end
end