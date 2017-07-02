Geocoder.configure(lookup: :test)

Geocoder::Lookup::Test.add_stub(
  "Los Angeles", [
    {
      'latitude'     => 34.0522342,
      'longitude'    => -118.2436849
    }
  ]
)
