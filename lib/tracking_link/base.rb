module TrackingLink
  class Base
    include Services

    SERVICES = [UPS, Fedex, USPS]

    def self.new(tracking_number)
      service = self.detect(tracking_number)
      if service
        service.new(tracking_number)
      else
        raise ArgumentError, "Invalid tracking number"
      end
    end

    def self.detect(tracking_number)
      SERVICES.each do |service|
        return service if service.detect(tracking_number)
      end
      false
    end
  end
end
