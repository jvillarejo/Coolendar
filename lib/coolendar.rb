require 'date'
require 'coolendar/calendar'
require 'coolendar/rules/holiday_rule'
require 'coolendar/rules/single_day'
require 'coolendar/rules/week_day'
require 'coolendar/rules/month_day'
require 'coolendar/rules/range'

module Coolendar

  class NoHolidayFoundError< StandardError; end
end