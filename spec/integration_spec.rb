require "capybara/rspec"
require "./app"

Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("the add_project path", {:type => :feature}) do
  it("creates a new project and displays it on the index page") do
    visit('/')
    click_link("Add project")
    fill_in("name", :with => "Litter clean up")
    fill_in("description", :with => "Clean up litter around the portland area")
    click_button("Add project")
    expect(page).to have_content("Litter clean up")
  end
end
# example integration test

# describe("the phrase parser path", {:type => :feature}) do
#   it("processes the user input and returns correct message if its a palindrome") do
#     visit("/")
#     fill_in("phrase1", :with => "madam")
#     fill_in("phrase2", :with => "anagram")
#     click_button("what am i?")
#     expect(page).to have_content("'madam' is a palindrome")
#   end
# end
