require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)


describe "to do path", { type: :feature } do
  it 'takes user input and lists all saved tasks' do
    visit '/'
    fill_in 'to_do', with: 'Pay bills'
    click_button 'Send'
    fill_in 'to_do', with: 'Program stuff'
    click_button 'Send'
    expect(page).to have_content 'Pay bills Program stuff'
  end
end
