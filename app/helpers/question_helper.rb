module QuestionHelper
  def question_status_text(question)
    question.solved? ? "solved" : "unsolved"
  end

  def question_status_color(question)
    question.solved? ? "green-500" : "red-500"
  end
end