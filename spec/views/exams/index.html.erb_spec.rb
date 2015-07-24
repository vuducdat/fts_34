require "rails_helper"

RSpec.describe "exams/index.html.erb" do
  include Devise::TestHelpers
  let(:user){FactoryGirl.create :user}
  let(:category1){FactoryGirl.create :category, name: "ducngusi"}
  let(:category2){FactoryGirl.create(:category, name: "legendmes")}
  let(:exam1){FactoryGirl.create(:exam, category_id: category1.id, user_id: user.id)}
  let(:exam2){FactoryGirl.create(:exam, category_id: category2.id, user_id: user.id)}
  let(:exam3){FactoryGirl.build(:exam, user_id: user.id)}
  before :each do
    sign_in user
    exam2.done = true
    assign(:exams, [exam1, exam2])
    assign(:categories, [category1, category2])
    assign(:exam, [exam3])
    allow(view).to receive_messages(will_paginate: nil)
  end

  describe "index" do
    before do
      render exam2
    end
    it{expect(rendered).to match /legendmes/}
  end
end
