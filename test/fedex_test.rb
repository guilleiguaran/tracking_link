require 'test_helper'

class FedexTest < Test::Unit::TestCase
  include TrackingLink
  include TrackingLink::Services

  def test_create_a_new_instance_detecting_service_of_tracking_number
    assert_kind_of Fedex, Base.new("871371078356")
  end

  def test_new_manually
    assert_kind_of Fedex, Fedex.new("871371078356")
  end

  def test_detect_if_is_a_tracking_number
    assert Fedex.detect("871371078356")
    assert !Fedex.detect("1Z9999W99999999999")
  end

  def test_link
    @tracking_number = Fedex.new("871371078356")
    assert_equal "http://www.fedex.com/Tracking?language=english&cntry_code=us&tracknumbers=871371078356",
      @tracking_number.link
  end
end
