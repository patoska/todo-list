class ToDo < ApplicationRecord
  belongs_to :notify, class_name: "User", foreign_key: "notify_id"
  belongs_to :added_by, class_name: "User", foreign_key: "added_by_id"
  belongs_to :assigned_to, class_name: "User", foreign_key: "assigned_to_id"

  after_save :estimate_time

  private

  def estimate_time
    if saved_change_to_title?
      promp = "Cuanto tiempo tomaría hacer esta tarea: '#{self.title}', que tu respuesta no sean mas de 8 palabras, ejemplo 'entre 15 min y 1 hora' o '3 días'"
      LlmQuestionJob.perform_later(self.id, promp)
    end
  end
end
