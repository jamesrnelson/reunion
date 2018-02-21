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

  def test_you_can_split_the_cost
    activity = Activity.new('Hiking')
    activity.add_participant('Alistair', 40)
    activity.add_participant('Owen', 28)
    activity.add_participant('Amalfi', 31)

    assert_equal 33, activity.split_cost
  end

  def test_can_figure_out_who_owes_what
    activity = Activity.new('Hiking')
    activity.add_participant('Alistair', 40)
    activity.add_participant('Owen', 28)
    activity.add_participant('Amalfi', 31)

    expected = 'Alistair owes -7 dollars, Owen owes 5 dollars, Amalfi owes 2 dollars'
    actual = activity.who_owes_what

    assert_equal expected, actual
  end
end
