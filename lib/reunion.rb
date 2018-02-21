require './lib/activity'
require 'pry'

# Defines the Reunion class
class Reunion
  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = []
    @reunion_cost = 0
  end

  def add_activity(name)
    name = Activity.new(name)
    @activities << name

  end

  def total_reunion_cost
    summing_up = @activities.map do |activity|
      activity.total_cost
    end
    summing_up.reduce(:+)
  end
end
