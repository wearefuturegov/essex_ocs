class JourneysController < ApplicationController
  def index
    @questions = questions
    @response = Response.new
    @next_step = 1.to_i
  end
end
