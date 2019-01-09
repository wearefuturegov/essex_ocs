class StepsController < ApplicationController
  before_action :get_step, :get_response

  def show
    @next_step = next_step
  end

  protected

  def journey
    @journey ||= questions[params[:journey_id]]
  end

  def get_step
    @step = journey['steps'][params[:id].to_i - 1]
    @title = @step['title']
    @hint = @step['hint']
    @name = @step['name']
    @answers = @step['answers']
  end

  def next_step
    next_step = params[:id].to_i + 1
    next_step if journey['steps'].count >= next_step
  end
end
