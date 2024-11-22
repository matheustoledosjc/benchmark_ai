class OpenAiClient
  def self.call(system_prompt, user_prompt)
    response = OPENAI_CLIENT.chat(
      parameters: {
        model: "gpt-4",
        messages: [
          { role: "system", content: system_prompt },
          { role: "user", content: user_prompt }
        ]
      }
    )
    {
      query_keys: response['usage']['prompt_tokens'],
      answer_keys: response['usage']['completion_tokens'],
      answer: response['choices'][0]['message']['content']
    }
  end
end
