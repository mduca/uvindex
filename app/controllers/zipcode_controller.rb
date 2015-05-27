require 'net/http'
require 'json'
class ZipcodeController < ApplicationController
  def index
  end

  def show

    if params["zipcode"]
      zc = params["zipcode"]
      url = "http://iaspub.epa.gov/enviro/efservice/getEnvirofactsUVHOURLY/ZIP/" + zc +"/JSON" 
      data = getUvindex url
      puts data
      render json: data.to_json
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

end
