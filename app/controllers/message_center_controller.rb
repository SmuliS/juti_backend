class MessageCenterController < ApplicationController
  def index
    user_location = param_to_a(params[:location])
    channel = params[:channel]

    #@messages = Message.geo_near(user_location, :max_distance => 2, :unit => :km, :spherical => false)
    @messages = Message.location(user_location).channel(channel)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

end