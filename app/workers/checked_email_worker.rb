class CheckedEmailWorker
  include Sidekiq::Worker

  def perform exam_id
    exam = Exam.find exam_id
    ExamMailer.checked_exam_notification(exam).delay(run_at: 5.minutes.from_now).deliver
  end
end
