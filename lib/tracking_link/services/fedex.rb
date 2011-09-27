module TrackingLink
  module Services
    class Fedex < Struct.new(:tracking_number)
      def link
        "http://www.fedex.com/Tracking?language=english&cntry_code=us&tracknumbers=#{tracking_number}"
      end

      def self.detect(tracking_number)
        (tracking_number =~ /^([0-9]{11,11})([0-9])$/) ||
        (tracking_number =~ /^96[0-9]{5,5}([0-9]{14,14})([0-9])$/) ||
        (tracking_number =~ /^([0-9]{15,15})$/) ||
        (tracking_number =~ /^[0-9]{2,2}([0-9]{15,15})([0-9])$/)
      end
    end
  end
end
