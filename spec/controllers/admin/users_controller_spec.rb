require "rails_helper"

RSpec.describe Admin::UsersController, type: :controller do
  before do
    @admin = FactoryGirl.create :user, role: "admin"
    @member = FactoryGirl.create :user, role: "normal"
    sign_in @admin
  end

  describe "GET #index" do
    context "admin render template index success" do
      before {get :index}
      it {expect(response).to render_template :index}
    end

    context "member access to template index of admin" do
      before do
        sign_out @admin
        sign_in @member
        get :index
      end
      it {expect(response).to redirect_to :root}
      it {expect(flash[:danger]).to eq "You are not admin !"}
    end
  end

  describe "DELETE #destroy" do
    it "should response index page after delete user" do
      delete :destroy, id: @member.id
      expect(response).to redirect_to admin_users_url
    end
  end
end
