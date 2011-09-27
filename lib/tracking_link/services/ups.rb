module TrackingLink
  module Services
    class UPS < Struct.new(:tracking_number)
      def link

      end

      def self.detect(tracking_number)
        true
      end
    end
  end
end
