module TrackingLink
  module Services
    class USPS < Struct.new(:tracking_number)
      def link

      end

      def self.detect(tracking_number)
        true
      end
    end
  end
end
