require 'spec_helper'

describe "LayoutLinks" do
  before(:each) do
    @base_title = "Sample App"
  end
  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector("title",:content => @base_title + " | Home")
  end
  it "should have a About page at '/about'" do
    get '/about'
    response.should have_selector("title",:content => @base_title + " | About")
  end
  it "should have a Contact page at '/contact'" do
    get '/contact'
    response.should have_selector("title",:content => @base_title + " | Contact")
  end
  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector("title",:content => @base_title + " | Help")
  end
  it "should have a Sign in page at '/signin'" do
    get '/signin'
    response.should have_selector("title",:content => @base_title + " | Sign in")
  end
  it "should have a Sign up page at '/signup'" do
    get '/signup'
    response.should have_selector("title",:content => @base_title + " | Sign up")
  end
  it "should have correct links on the layout" do
    visit root_path
    click_link 'Sign up now!'
    response.should have_selector("title", :content => "Sign up")
    click_link "About"
    response.should have_selector("title", :content => "About")
    click_link "Help"
    response.should have_selector("title", :content => "Help")
    click_link "Contact"
    response.should have_selector("title", :content => "Contact")
    click_link "Sign in"
    response.should have_selector("title", :content => "Sign in")
  end
end
