require "rails_helper"

describe "static_pages/home.html.erb" do
  it do
    render
    expect(rendered).to have_link "Sign up now !", href: new_user_registration_path
    expect(rendered).to include "Welcome to the Test App"
    expect(rendered).to include "This is the home page for the test application."
  end
end
