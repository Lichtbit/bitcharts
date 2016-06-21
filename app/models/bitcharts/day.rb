module Bitcharts
  class Day < ActiveRecord::Base
    validates :date, :key, :value, presence: true
  end
end
