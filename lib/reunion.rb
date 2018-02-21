require './lib/activity'

# Defines the Reunion class
class Reunion
  attr_reader :location,
              :activities

  def initialize(location)
    @location = location
    @activities = {}
  end

  def add_activity(name)
    new_activity = { name => Activity.new(name) }
    @activities.merge!(new_activity)
  end

  def total__reunion_cost
    summing_up = @activities.values
    summing_up.map(&:total_cost).reduce(:+)
  end
end
