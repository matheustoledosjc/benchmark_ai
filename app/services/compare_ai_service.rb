class CompareAiService
  def initialize(system_prompt, user_prompt)
    @system_prompt = system_prompt
    @user_prompt = user_prompt
  end

  def perform
    # gemini_result = benchmark { GeminiClient.call(@system_prompt, @user_prompt) }
    # openai_result = benchmark { OpenAiClient.call(@system_prompt, @user_prompt) }

    # {
    #   gemini: format_result(gemini_result),
    #   open_ai: format_result(openai_result)
    # }

    gemini_result = benchmark { GeminiClient.call(@system_prompt, @user_prompt) }

    {
      gemini: format_result(gemini_result)
    }
  end

  private

  def benchmark
    start_time = Time.now
    response = yield
    end_time = Time.now

    {
      time: (end_time - start_time).round(2),
      data: response
    }
  end

  def format_result(result)
    {
      time: result[:time],
      query_keys: result[:data][:query_keys],
      answer_keys: result[:data][:answer_keys],
      answer_data: result[:data][:answer]
    }
  end
end
