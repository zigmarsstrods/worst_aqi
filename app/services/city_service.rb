class CityService
  
    def results
        State.all.each do |state|
            city_response = response(state)
            if city_response.is_a?(Net::HTTPSuccess)
                res = json_document(city_response.body)
                save_results(res, state)
            else
                city_response.to_s
            end
        end 
        
    end

    def save_results(res, state)
        res["data"].each do |obj|
            cy =City.new(name: obj["city"], state: state)
            cy.save!
        end
    end

    private

    def response(state)
      Net::HTTP.get_response(uri(state))
    end
    
    def uri(state)
      URI(url(state))
    end

    def url(state)
        puts "http://api.airvisual.com/v2/cities?state=#{state.name}&country=#{state.country.name}&key=76934681-62ff-447b-ac22-64f36afd55d4"
        "http://api.airvisual.com/v2/cities?state=#{state.name}&country=#{state.country.name}&key=76934681-62ff-447b-ac22-64f36afd55d4"
    end

    def json_document(content)
      JSON.parse(content)
    end
end