class ApplicationController < ActionController::Base
  protect_from_forgery

  def s_to_a(string)
    string.split(",")
  end

  def param_to_a(param)
    param.to_s.split(",")
  end
end
