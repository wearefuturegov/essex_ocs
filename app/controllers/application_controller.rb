class ApplicationController < ActionController::Base
  def index; end

  def questions
    @questions ||= YAML.safe_load(File.read(Rails.root.join('config', 'questions.yml')))
  end

  def get_response
    @response ||= Response.find(session[:response_id])
  end
end
