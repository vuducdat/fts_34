class Result < ActiveRecord::Base
  belongs_to :exam
  belongs_to :question
  belongs_to :answer

  delegate :is_correct, to: :answer, prefix: true, allow_nil: true
end
