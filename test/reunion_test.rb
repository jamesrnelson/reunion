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
    reunion.add_activity(name)

    assert_instance_of Hash, reunion.activities
  end

  def test_
end
