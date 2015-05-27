require 'json'
class ZipcodeController < ApplicationController
  def index
  end

  def show
	  @res = Hash.new
	  @res["a"] = "this is an element 1"
	  @res["b"] = "this is an element 2"
	  @res["c"] = "this is an element 3"

	  @res["json"] = @res.to_json
	  #puts @res["json"]
	  #@result = "HI:" + params["zipcode"]
	  #puts params["zipcode"]

	  render json: @res["json"]
  end

end
