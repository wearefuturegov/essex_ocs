class ResponsesController < ApplicationController
  before_action :get_response, only: %i[update show]

  def new
    @response = Response.new
  end

  def create
    @response = Response.new(response_params)
    if @response.save
      session[:response_id] = @response.id
      redirect_to journeys_path
    else
      render :new
    end
  end

  def update
    @response = Response.find(params[:id])
    @response.update(response_params)

    if Comfy::Cms::Site.first
      @results = Comfy::Cms::Site.first.pages.first.children
      @help_category_results = @results.where(slug: @response["help_category"])
      @info_types = @response["info_type"].dup
      @info_types.delete("something_else")
    end

    if params[:next_step].present? && @response.category != 'not_sure' && @response.help_category != ["something_else"]
      redirect_to journey_step_path(id: params[:next_step], journey_id: @response.category)
    else
      render :show
    end
  end

  def show
    @results = Comfy::Cms::Site.first.pages.first.children
    @help_category_results = @results.where(slug: @response["help_category"])
    @info_types = @response["info_type"].dup
    @info_types.delete("something_else")
  end

  def send_results_sms
    @response = Response.find(params[:response_id])
    @response.update(response_params)
    body = "Hello #{@response.forename}. You asked us to text some recommendations from the Home and healthy assistant. Just click on the link in this message to see what info and services we've found for you. https://wwww.homehealthy.co.uk/responses/#{@response.id}?sms=true"
    TwilioService.send_sms(body, @response.phone_number)
    redirect_to response_path(@response)
  end

  private

  def response_params
    params.require(:response).permit(
      :phone_number,
      :forename,
      :surname,
      :suggested_category,
      :suggested_help_category,
      :suggested_info_type,
      :category,
      help_category: [], info_type: [], payment_options: [])
  end
  
  def get_response
    @response = Response.find(params[:id])
  end
end
