# Defines the activity class
class Activity
  attr_reader :name,
              :participants,
              :total_cost

  def initialize(name)
    @name = name
    @participants = {}
    @total_cost = 0
  end

  def add_participant(name, amount_paid)
    new_participants = { name => amount_paid }
    @total_cost += amount_paid
    @participants.merge!(new_participants)
  end
end
