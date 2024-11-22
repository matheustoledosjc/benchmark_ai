class GeminiClient
  def self.call(system_prompt, user_prompt)
    response = GEMINI_CLIENT.stream_generate_content(
      { contents: [
        { role: 'user', parts: { text: system_prompt } },
        { role: 'user', parts: { text: user_prompt } }
      ] }
    ).first

    response
    # build_response(response)
  end

  private

  def self.build_response(response)
    response["candidates"].each do |candidate|
      {
        query_keys: response["usageMetadata"]["promptTokenCount"],
        answer_keys: response["usageMetadata"]["candidatesTokenCount"],
        answer: canditate["content"]["parts"].first["text"]
      }
    end
  end
end
