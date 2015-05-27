require 'net/http'
require 'json'
class ZipcodeController < ApplicationController
  def index
  end

  def show

    if params["zipcode"]
      url = "http://iaspub.epa.gov/enviro/efservice/getEnvirofactsUVHOURLY/ZIP/" + params["zipcode"]  +"/JSON" 

      @data = Hash.new
      @data["zipcode"] = params["zipcode"]
      @data["data"] = getUvindex(url).to_json
      @data["city"] = getCity(params["zipcode"]).to_json

      data = getUvindex url
      puts data
      #render json: data.to_json
      render json: @data["city"]
    end

	  @res = Hash.new
	  @res["a"] = "this is an element 1"
	  @res["b"] = "this is an element 2"
	  @res["c"] = "this is an element 3"

	  @res["json"] = @res.to_json
	  #puts @res["json"]
	  #@result = "HI:" + params["zipcode"]
	  #puts params["zipcode"]

	  #render json: @res["json"]
  end

  def getUvindex url 
    uri = URI(url) 
    data = Net::HTTP.get(uri)
  end

  def getCity zipcode
    uri = URI("http://zip.getziptastic.com/v2/US/" + zipcode)
    data = Net::HTTP.get(uri)
  end


end
