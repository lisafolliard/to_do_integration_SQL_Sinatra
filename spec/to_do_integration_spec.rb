require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
  it('allows a user to click on specific list link and see tasks belonging to that list') do
    visit('/')
    click_link('Add a New List')
    fill_in('name', :with => 'Grocery List')
    click_button('Add List')
    expect(page).to have_content('Success!')
  end
end
