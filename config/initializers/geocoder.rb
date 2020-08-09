# config/initializers/geocoder.rb

Geocoder.configure(
  # geocoding service
  lookup: :google,

  # geocoding service request timeout (in seconds)
  timeout: 3,

  api_key: "AIzaSyCQIh8MGEehUptz2u7vr8JbRvyvB6mA4M8",

  # default units
  units: :km


)
