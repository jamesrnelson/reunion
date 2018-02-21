# Defines the activity class
class Activity
  attr_reader :name,
              :participants

  def initialize(name)
    @name = name
    @participants = {}
  end

  def add_participant(name, amount_paid)
    new_participants = { name => amount_paid }
    @participants.merge(new_participants)
  end
end
