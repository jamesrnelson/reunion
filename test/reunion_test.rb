require 'minitest'
require 'minitest/test'
require 'minitest/autorun'
require './lib/reunion'

class ReunionTest < Minitest::Test
  def test_the_reunion_exists
    reunion = Reunion.new('Port Orchard')

    assert_instance_of Reunion, reunion
  end

  def test_the_reunion_has_a_location
    reunion = Reunion.new('Port Orchard')

    assert_equal 'Port Orchard', reunion.location
  end

  def test_the_reunion_has_activities
    reunion = Reunion.new('Port Orchard')

    assert_empty reunion.activities

    reunion.add_activity('hiking')
    reunion.add_activity('three_legged_race')

    assert_instance_of Array, reunion.activities
    assert_equal 2, reunion.activities.length
    assert_instance_of Activity, reunion.activities[0]
  end

  def test_the_reunion_has_a_total_cost
    reunion = Reunion.new('Port Orchard')
    reunion.add_activity('hiking')
    reunion.add_activity('three_legged_race')
    reunion.activities[0].add_participant('Owen', 28)
    reunion.activities[0].add_participant('Alistair', 40)
    reunion.activities[0].add_participant('Amalfi', 31)
    reunion.activities[1].add_participant('Kevin', 27)
    reunion.activities[1].add_participant('Elmira', 42)
    reunion.activities[1].add_participant('Amalfi', 30)

    assert_equal 198, reunion.total_reunion_cost
  end
end
