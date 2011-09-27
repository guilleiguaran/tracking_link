require 'test_helper'

class BaseTest < Test::Unit::TestCase
  include TrackingLink
  include TrackingLink::Services

  def test_create_a_new_instance_detecting_service_of_tracking_number
    assert_kind_of UPS, Base.new("1Z9999W99999999999")
  end

  def test_new_manually
    assert_kind_of UPS, UPS.new("1Z9999W99999999999")
  end

  def test_detect_if_is_a_tracking_number
    assert UPS.detect("1Z9999W99999999999")
    assert !UPS.detect("477179081230")
  end

  def test_link
    @tracking_number = UPS.new("1Z9999W99999999999")
    assert_equal "http://wwwapps.ups.com/WebTracking/processInputRequest?sort_by=status&tracknums_displayed=1&TypeOfInquiryNumber=T&loc=en_us&InquiryNumber1=1Z9999W99999999999&track.x=0&track.y=0",
      @tracking_number.link
  end
end
