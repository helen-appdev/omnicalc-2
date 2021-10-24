class UmbrellaController < ApplicationController
    
  def geocode_form
    render({:template => "umbrella_templates/geocode_form.html.erb"})
  end 
  
  def geocode_results
        @address = params.fetch("user_input")
        gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=" + @address + "&key=AIzaSyD8RrOFB0dPsF-leqeFJdmX3yOvcQbfNyY"

        @raw_data = open(gmaps_url).read

        @parsed_data = JSON.parse(@raw_data)
        
        @results = @parsed_data.fetch("results")
        @results2 = @results.at(0)
        @results3 = @results2["geometry"]["location"]
        @lat = @results3["lat"]
        @long = @results3["lng"]
        
        render({ :template => "umbrella_templates/geocode_results.html.erb"})
    end







  end