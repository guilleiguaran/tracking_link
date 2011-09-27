require 'test_helper'

class BaseTest < Test::Unit::TestCase
  include TrackingLink
  include TrackingLink::Services

  def test_create_a_new_instance_detecting_service_of_tracking_number
    assert_kind_of Fedex, Base.new("477179081230")
  end

  def test_raise_error_with_invalid_tracking_number
    assert_raise(ArgumentError) { Base.new("1234567890") }
  end

  def test_detect_the_class_of_tracking_number
    assert_equal Fedex, Base.detect("871371078356")
    assert_equal UPS, Base.detect("1Z9999W99999999999")
    assert_equal USPS, Base.detect("9101128882300879851252")
  end
end
