require 'test_helper'

class BaseTest < Test::Unit::TestCase
  include TrackingLink
  include TrackingLink::Services

  def test_create_a_new_instance_detecting_service_of_tracking_number
    assert_kind_of Fedex, Base.new("477179081230")
  end

  def detect_the_class_of_tracking_number
    assert Fedex, Base.detect("477179081230")
  end
end
