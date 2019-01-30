class ResponsesController < ApplicationController
  before_action :get_response, only: %i[update show]

  def create
    response = Response.create(response_params)
    session[:response_id] = response.id
    redirect_to journey_step_path(journey_id: response.category, id: 1)
  end

  def update
    @response = Response.find(params[:id])
    @response.update(response_params)
    if params[:next_step].present?
      redirect_to journey_step_path(id: params[:next_step], journey_id: @response.category)
    else
      @results = results
      render :show
    end
  end

  def show
    @results = results
  end

  private

  def response_params
    params.require(:response).permit(:category, help_category: [], info_type: [], payment_options: [])
  end
  
  def get_response
    @response = Response.find(params[:id])
  end
end
