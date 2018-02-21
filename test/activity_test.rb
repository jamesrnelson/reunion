require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test
  def test_it_exists
    activity = Activity.new('Hiking')

    assert_instance_of Activity, activity
  end

  def test_the_activity_has_a_name
    activity = Activity.new('Hiking')

    assert_equal 'Hiking', activity.name
  end

  def test_can_add_participant
    activity = Activity.new('Hiking')

    assert_empty activity.participants

    activity.add_participant('Alistair', 40)
    activity.add_participant('Owen', 30)

    assert_instance_of Hash, activity.participants
  end

  def test_the_hash_tells_how_much_participant_paid
    activity = Activity.new('Hiking')
    activity.add_participant('Alistair', 40)
    activity.add_participant('Owen', 30)

    assert_equal 40, activity.participants['Alistair']
  end

  def test_the_activity_has_a_total_cost
    activity = Activity.new('Hiking')
    activity.add_participant('Alistair', 40)
    activity.add_participant('Owen', 30)

    assert_equal 70, activity.total_cost
  end
end
