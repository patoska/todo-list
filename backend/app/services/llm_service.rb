require "faraday"
require "json"

class LlmService
  BASE_URL = ENV.fetch("LLM_URL")

  def self.ask(prompt, model: "llama3")
    conn = Faraday.new(url: BASE_URL) do |f|
      f.request :json
      f.response :json, content_type: /\bjson$/
      f.adapter Faraday.default_adapter
    end

    response = conn.post("/api/generate") do |req|
      req.body = {
        model: model,
        prompt: prompt,
        stream: false
      }
    end

    if response.success?
      response.body["response"]
    else
      raise "LLM request failed: #{response.status} - #{response.body}"
    end
  end
end
