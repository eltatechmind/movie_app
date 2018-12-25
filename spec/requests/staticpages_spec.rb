require 'rails_helper'
include Capybara::DSL

RSpec.describe "Staticpages", type: :request do
  describe "GET /help" do
    it "works and read valid request" do
      get help_path
      expect(response).to have_http_status(200)
    end
    it "has valid info when being visited using capybara methods" do
      visit help_path
      page.should have_content("Check on The Movies App source code on the Github Project Repo. This app was created using ruby on rails all data are fetched from themoviedb.org .")
    end
  end
  describe "GET /contact" do
    it "works and read valid request" do
      get contact_path
      expect(response).to have_http_status(200)
    end
    it "has valid info when being visited using capybara methods" do
      visit contact_path
      page.should have_content("Contact Ahmed Fouad about The Movies App on LinkedIn.")
    end
  end
  describe "GET /about" do
    it "works and read valid request" do
      get about_path
      expect(response).to have_http_status(200)
    end
    it "has valid info when being visited using capybara methods" do
      visit about_path
      page.should have_content("The Movies App is a Web Application created to browse trending movies, search for your favorite movie and know more info about it. The app was created as a task for a junior software engineer who's seeking a job vacancy in Lynks Company.")
    end
  end
  describe "GET /" do
    it "works and read valid request" do
      get root_path
      expect(response).to have_http_status(200)
    end
    it "has valid info when being visited using capybara methods" do
      visit root_path
      page.should have_content("This is the home page for the Movies web application.")
    end
  end
end
