class ResponsesController < ApplicationController
  before_action :get_response, only: %i[update show help_category_result]

  def new
    @response = Response.new
  end

  def create
    @response = Response.create(response_params)
    session[:response_id] = @response.id
    if @response.category == 'not_sure'
      render 'no_information'
    elsif params[:next_step].present?
      redirect_to journey_step_path(id: params[:next_step], journey_id: @response.category)
    end
  end

  def update
    @response = Response.find(params[:id])
    @response.update(response_params)

    if (@response.help_category == ["something_else"]) || (@response.category == 'not_sure')
      if params[:next_step].to_i > 1
        @previous_step = params[:next_step].to_i - 1
      end
      render 'no_information'
    elsif params[:next_step].present?
      redirect_to journey_step_path(id: params[:next_step], journey_id: @response.category)
    else
      get_results
      if @help_category_results.size == 1
        @help_category_result = @help_category_results.first
        render 'help_category_result'
      else
        render :show
      end
    end

  end

  def show
    get_results
    if @help_category_results.size == 1
      @help_category_result = @help_category_results.first
      render 'help_category_result'
    end
  end

  def help_category_result
    get_results
    @help_category_result = @results.where(slug: params[:help_category_result]).first
    @top_level_help_category_results = @help_category_results.where.not(id: @help_category_result.id)
  end

  def send_results_sms
    @response = Response.find(params[:response_id])
    @response.update(response_params)
    body = "Hello, you asked us to text some recommendations from the Home and healthy assistant. Just click on the link in this message to see what info and services we've found for you. https://www.homehealthy.co.uk/responses/#{@response.id}?sms=true"
    TwilioService.send_sms(body, @response.phone_number)
    redirect_to response_path(@response)
  end

  private

  def response_params
    params.require(:response).permit(
      :phone_number,
      :participant_number,
      :suggested_category,
      :suggested_help_category,
      :suggested_info_type,
      :category,
      help_category: [], info_type: [], payment_options: [])
  end
  
  def get_response
    @response = Response.find(params[:id])
  end

  def get_results
    @results = Comfy::Cms::Site.first.pages.first.children
    @help_category_results = @results.where(slug: @response["help_category"])
    @top_level_help_category_results = @help_category_results
    @previous_step = 2
  end
end
