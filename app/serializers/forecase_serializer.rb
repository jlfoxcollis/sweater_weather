class ForecastSerializer
  include FastJsonapi::ObjectSerializer
  set_id { nil }
  set_type { "forecast" }
  attributes  :datetime, 
              :sunrise, 
              :sunset, 
              :temperature, 
              :feels_like, 
              :humidity,
              :uvi,
              :visibility,
              :conditions,
              :icon
end