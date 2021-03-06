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

describe("the project path", {:type => :feature}) do
  it("will click a project and go to it's page") do
    visit('/')
    click_link("Add project")
    fill_in("name", :with => "Litter clean up")
    fill_in("description", :with => "Clean up litter around the portland area")
    click_button("Add project")
    click_link('Litter clean up')
    expect(page).to have_content("Litter clean up")
    expect(page).to have_content("Clean up litter around the portland area")
  end

  it("will add a volunteer to a project") do
    visit('/')
    click_link("Add project")
    fill_in("name", :with => "Litter clean up")
    fill_in("description", :with => "Clean up litter around the portland area")
    click_button("Add project")
    click_link('Litter clean up')

    click_link('Add volunteer')
    fill_in("name", :with => "Billy Bobson")
    click_button("Add volunteer")
    expect(page).to have_content("Billy Bobson")
  end

  it("will update a project") do
    visit('/')
    click_link("Add project")
    fill_in("name", :with => "Litter clean up")
    fill_in("description", :with => "Clean up litter around the portland area")
    click_button("Add project")
    click_link('Litter clean up')

    click_link('Edit project')
    fill_in('name', :with => "Recycle litter")
    fill_in('description', :with => "Sort through litter and decide what is recyclable")
    click_button('Update project')
    expect(page).to have_content("Recycle litter")
  end

  it("will delete a project") do
    visit('/')
    click_link("Add project")
    fill_in("name", :with => "Litter clean up")
    fill_in("description", :with => "Clean up litter around the portland area")
    click_button("Add project")
    click_link('Litter clean up')
    click_button('Delete project')
    expect(page).to have_no_content('Litter clean up')
  end

  it("will update a volunteer") do
    visit('/')
    click_link("Add project")
    fill_in("name", :with => "Litter clean up")
    fill_in("description", :with => "Clean up litter around the portland area")
    click_button("Add project")
    click_link('Litter clean up')
    click_link('Add volunteer')
    fill_in("name", :with => "Billy Bobson")
    click_button("Add volunteer")

    click_link('Billy Bobson')
    expect(page).to have_content('Billy Bobson')

    fill_in('name', :with => "James Dunsberg")
    click_button('Update volunteer')
    expect(page).to have_content('James Dunsberg')
  end

  it("will delete a volunteer") do
    visit('/')
    click_link("Add project")
    fill_in("name", :with => "Litter clean up")
    fill_in("description", :with => "Clean up litter around the portland area")
    click_button("Add project")
    click_link('Litter clean up')
    click_link('Add volunteer')
    fill_in("name", :with => "Billy Bobson")
    click_button("Add volunteer")
    click_link('Billy Bobson')
    click_button("Delete volunteer")
    expect(page).to have_no_content('Billy Bobson')
  end
end
