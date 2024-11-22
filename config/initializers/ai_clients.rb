GEMINI_CLIENT = Gemini.new(
  credentials: {
    service: 'generative-language-api',
    api_key: ENV['GEMINI_API_KEY']
  },
  options: { model: 'gemini-pro', server_sent_events: true }
)

# OPENAI_CLIENT = OpenAI::Client.new(
#   access_token: ENV['OPENAI_API_KEY'],
#   log_errors: true
# )
