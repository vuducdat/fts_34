class ExamMailer < ApplicationMailer
  def exam_notification exam
    @exam = exam
    mail to: exam.user.email, subject: t("messages.subject")
  end
end
