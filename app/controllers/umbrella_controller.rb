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
        @first_result = @results["results"]["location"]
        
        render({ :template => "umbrella_templates/geocode_results.html.erb"})
    end







  end