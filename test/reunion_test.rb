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
    reunion.add_activity('three-legged race')

    assert_instance_of Hash, reunion.activities
    assert_equal 2, reunion.activities.length
    assert_instance_of Activity, reunion.activities['hiking']
  end

  def test_the_reunion_has_a_total_cost
    reunion = Reunion.new('Port Orchard')

    assert_equal 198, reunion.total_cost
  end
end
