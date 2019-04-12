class JourneysController < ApplicationController
  def index
    @questions = questions
    if params[:response_id] # If coming back, load response and previous answer
      @response = Response.find(params[:response_id])
    else
      @response = Response.new
    end
    @next_step = 1.to_i
  end
end
