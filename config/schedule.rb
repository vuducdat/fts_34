every 1.hour do
  rake "delete_not_done_exam"
end

every 1.hour do
  rake "send_finish_exam_email"
end
