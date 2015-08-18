require 'capybara/rspec'
require './app'
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new list', {:type => :feature}) do
  it('allows a user to click on specific list link and see tasks belonging to that list') do
    visit('/')
    click_link('Add a New List')
    fill_in('list', :with => 'Grocery List')
    click_button('Add List')
    expect(page).to have_content('Success!')
  end
end

describe('view details for single list', {:type => :feature}) do
  it('allows a user to click a list and see task details') do
    test_list = List.new({:name => "Grocery List", :id => nil})
    test_list.save()
    test_task = Task.new({:description => "apples", :list_id => test_list.id()})
    test_task.save()
    visit('/')
    click_link(test_list.name())
    expect(page).to have_content(test_task.description())
  end
end
