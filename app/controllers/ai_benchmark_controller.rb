class AiBenchmarkController < ApplicationController
  def compare
    system_prompt = params[:system_prompt]
    user_prompt = params[:user_prompt]

    service = CompareAiService.new(system_prompt, user_prompt)
    result = service.perform

    render json: result
  rescue StandardError => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end
