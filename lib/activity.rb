require 'pry'

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

  def split_cost
    @total_cost / @participants.length
  end

  def who_owes_what
    amounts = @participants.to_h.map do |participant|
      "#{participant[0]} owes #{split_cost - participant[1]} dollars"
    end
    amounts.join(', ')
  end
end
