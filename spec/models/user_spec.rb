require "rails_helper"

RSpec.describe User, type: :model do
  subject {FactoryGirl.create :user}
  it {is_expected.to be_valid}

  describe "#name" do
    before {subject.name = nil}
    it {is_expected.to have(0).error_on(:name)}

    before {subject.name = "quaytay"}
    it {is_expected.to have(0).error_on(:name)}
  end

  describe "#email" do
    before {subject.email = nil}
    it {is_expected.to have(1).error_on(:email)}

    before {subject.email = "legendme"}
    it {is_expected.to have(1).error_on(:email)}

    subject {FactoryGirl.build :user}
    before {@another_user = FactoryGirl.create :user}
    it {is_expected.to have(1).error_on(:email)}
  end

  describe "#password" do
    before {subject.password = nil}
    it {is_expected.to have(1).error_on(:password)}

    before {subject.password = "123456"}
    it {is_expected.to have(1).error_on(:password)}
  end

  describe "#password_confirmation" do
    before {subject.password = "12345678", subject.password_confirmation = "87654321"}
    it {is_expected.to have(1).error_on(:password_confirmation)}
  end

  context "have_many exams" do
    it {is_expected.to have_many(:exams)}
  end
end
