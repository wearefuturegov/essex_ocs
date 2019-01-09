class JourneysController < ApplicationController
  def index
    @questions = questions
    @response = Response.new
  end
end
