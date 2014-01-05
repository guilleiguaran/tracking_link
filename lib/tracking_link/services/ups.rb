module TrackingLink
  module Services
    class UPS < Struct.new(:tracking_number)
      def link
        "http://wwwapps.ups.com/WebTracking/processInputRequest?sort_by=status&tracknums_displayed=1&TypeOfInquiryNumber=T&loc=en_us&InquiryNumber1=#{tracking_number}&track.x=0&track.y=0"
      end

      def self.detect(tracking_number)
        tracking_number =~ /^1Z(\w{15})(\w)$/
      end
    end
  end
end
