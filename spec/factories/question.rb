FactoryGirl.define do
  factory :question do
    content {Faker::Lorem.sentence}
      before :create do |question|
        Settings.question.answers.minimum.times do |i|
          question.answers << FactoryGirl.build(:answer, question: question,
            is_correct: i == 0)
        end
      end
  end
end
