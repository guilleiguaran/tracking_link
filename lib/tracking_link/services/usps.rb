module TrackingLink
  module Services
    class USPS < Struct.new(:tracking_number)
      def link
        "http://trkcnfrm1.smi.usps.com/PTSInternetWeb/InterLabelInquiry.do?origTrackNum=#{tracking_number}"
      end

      def self.detect(tracking_number)
        (tracking_number =~ /^(9[14][0-9]{19})([0-9])$/) ||
        (tracking_number =~ /^([0-9]{2})([0-9]{9})([0-9]{8})([0-9])$/) ||
        (tracking_number =~ /^([A-Z]{2})([0-9]{9})([A-Z]{2})$/)
      end
    end
  end
end
