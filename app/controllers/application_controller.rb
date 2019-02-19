class ApplicationController < ActionController::Base

  def index
    @welcome_page = Comfy::Cms::Site.first.pages.first
  end

  def questions
    @questions ||= YAML.safe_load(File.read(Rails.root.join('config', 'questions.yml')))
  end

  def results
    @results ||= YAML.safe_load(File.read(Rails.root.join('config', 'results.yml')), [], [], true)
  end

  def get_response
    @response ||= Response.find(session[:response_id])
  end
end
