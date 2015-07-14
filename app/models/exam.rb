class Exam < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :results, dependent: :destroy
  has_many :questions, through: :results

  accepts_nested_attributes_for :results, allow_destroy: true,
    reject_if: :all_blank

  before_save :make_random_questions
  before_update :update_correct_answers, :mark_the_exam
  after_update :send_mail_admin, only: :update
  after_update :send_mail_to_user, only: :update

  scope :order_by_created_at, ->{order created_at: :DESC}
  scope :not_done, ->{where done: false}
  scope :expired, ->{not_done.where("created_at <= ?",
    Time.now - Settings.experied_time_del_exam.hours)}

  private
  def make_random_questions
    @questions = category.questions.random_questions
    @questions.each {|question| results.build question: question}
  end

  def mark_the_exam
    self.correct_number = results.select{|result| result.correct}.count
  end

  def update_correct_answers
    results.each do |result|
      result.correct = result.answer.is_correct unless result.answer_id.nil?
    end
  end

  def send_mail_admin
    EmailWorker.perform_async @exam.id, current_user.id
  end

  def send_mail_to_user
    CheckedEmailWorker.perform_async @exam.id
  end
end
