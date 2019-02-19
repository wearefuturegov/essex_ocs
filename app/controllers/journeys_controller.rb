class JourneysController < ApplicationController
  def index
    @questions = questions
    @response = Response.find(session[:response_id])
    @next_step = 1.to_i
  end
end
