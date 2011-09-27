require 'test_helper'

class USPSTest < Test::Unit::TestCase
  include TrackingLink
  include TrackingLink::Services

  def test_create_a_new_instance_detecting_service_of_tracking_number
    assert_kind_of USPS, Base.new("9101128882300879851252")
  end

  def test_new_manually
    assert_kind_of USPS, USPS.new("9101128882300879851252")
  end

  def test_detect_if_is_a_tracking_number
    assert USPS.detect("9101128882300879851252")
    assert !USPS.detect("477179081230")
  end

  def test_link
    @tracking_number = USPS.new("9101128882300879851252")
    assert_equal "http://trkcnfrm1.smi.usps.com/PTSInternetWeb/InterLabelInquiry.do?origTrackNum=9101128882300879851252",
      @tracking_number.link
  end
end
