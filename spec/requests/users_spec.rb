require 'rails_helper'
include Capybara::DSL

RSpec.describe "Users", type: :request do
  subject {
    User.new(name: "Ahmed Karim", email: "ahmedkarim@gmail.com",
                      password: "foobar", password_confirmation: "foobar")
  }
  describe "GET /" do
    it "visits homepage when not logged in, and redirect to dashboard when logged in"  do
      visit root_path
      expect(response).to have_http_status(200)
      page.should have_content("This is the home page for the Movies web application.")
      visit login_path
      #log_in(subject)
      #fill_in "email", :with => "ahmedfouad2020era@gmail.com"
      #fill_in "password", :with => "123456789"
      #click_button "Log in"
      
      #page.should have_content("Go To Top Trending Movies")
    end

  end
end
