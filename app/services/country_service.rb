class CountryService
  
    def results
      if response.is_a?(Net::HTTPSuccess)
        json_document(response.body)
      else
        response.to_s
      end
    end

    def save_results
        results["data"].each do |obj|
            # if obj["country"] == "Latvia" 
              c =Country.new(name: obj["country"])
              c.save!
            # end

        end
    end

    private

    def response
      @response ||= Net::HTTP.get_response(uri)
    end
    
    def uri
      @uri ||= URI(url)
    end

    def url
      @url ||= "http://api.airvisual.com/v2/countries?key=b18766ab-b02c-4b35-9899-8cbb4e511228"
    end

    def json_document(content)
      JSON.parse(content)
    end
end