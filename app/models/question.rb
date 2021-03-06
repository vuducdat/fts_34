class Question < ActiveRecord::Base
  belongs_to :category

  has_many :answers, dependent: :destroy
  has_many :results
  has_many :exams, through: :results

  accepts_nested_attributes_for :answers,
    reject_if: ->attributes{attributes["content"].blank?},
    allow_destroy: true

  validates :content, presence: true
  validates :answers, length: {minimum: Settings.question.answers.minimum}

  scope :random_questions, ->{order("RANDOM()").limit(Settings.limited_number_of_records)}
end
