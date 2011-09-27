module TrackingLink
  autoload :Base,     "tracking_link/base"
  module Services
    autoload :Fedex,  "tracking_link/services/fedex"
    autoload :UPS,    "tracking_link/services/ups"
    autoload :USPS,   "tracking_link/services/usps"
  end
end
