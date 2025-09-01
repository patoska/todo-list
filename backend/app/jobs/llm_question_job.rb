class LlmQuestionJob < ApplicationJob
  queue_as :default

  def perform(to_do_id, promp)
    answer = LlmService.ask(promp)
    
    Rails.logger.info "LLM answered: #{answer}"
    to_do = ToDo.find(to_do_id)
    to_do.update(estimate: answer)
  end
end
