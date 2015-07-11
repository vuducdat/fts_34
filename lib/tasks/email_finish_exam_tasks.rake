desc "auto send finish exam to email of user"
task send_finish_exam_email: :environment do
  unfinished_exams = Exam.not_done
  unfinished_exams.each do |exam|
    exist_time = Time.now - exam.created_at
    ExamMailer.exam_notification(exam).deliver_now! unless exist_time < 2.hours
  end
end
