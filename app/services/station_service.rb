class StationService
  
  def results
        Country.all.each do |country|
            station_response = response(country.name)
            # binding.pry
            if station_response.is_a?(Net::HTTPSuccess)
                res = json_document(station_response.body)
                if res["data"].any? && res["data"][0]["aqi"].to_s != "-"
                  save_results(res, country)
                end
            else
                station_response.to_s
            end
        end 
            end

    def save_results(res, country)
        obj = res["data"][0]
            s =Station.new(name: obj["station"]["name"], aqi: obj["aqi"], time: obj["time"]["stime"], country: country)
            s.save!
    end

    private

    def response(country_name)
      Net::HTTP.get_response(uri(country_name))
    end
    
    def uri(country_name)
      URI(url(country_name))
    end

    def url(country_name)
      "https://api.waqi.info/search/?keyword=#{country_name}&token=071e954da063a11e52cbe680fd37786d66bd9feb"
    end

    def json_document(content)
      JSON.parse(content)
    end
end