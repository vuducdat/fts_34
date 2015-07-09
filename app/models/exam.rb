class Exam < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  has_many :results, dependent: :destroy
  has_many :questions, through: :results

  accepts_nested_attributes_for :results, allow_destroy: true,
    reject_if: :all_blank

  before_save :make_random_questions

  scope :order_by_created_at, ->{order created_at: :DESC}

  private
  def make_random_questions
    @questions = category.questions.random_questions
    @questions.each {|question| results.build question: question}
  end
end
