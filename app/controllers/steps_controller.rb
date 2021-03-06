class StepsController < ApplicationController
  before_action :get_step, :get_response

  def show
    @next_step = next_step
    @previous_step = previous_step
    @current_step = params[:id].to_i + 1
    @step_count = journey['steps'].count + 1
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

  def previous_step
    previous_step = params[:id].to_i - 1
    previous_step if previous_step.positive?
  end
end
