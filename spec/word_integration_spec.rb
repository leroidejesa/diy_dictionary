require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the path of dictionary', {:type => :feature}) do
  before() do
    Word.clear()
  end

  it('processes the user input and directs user to main page') do
    visit('/')
    click_link('Add New Entry')
    fill_in('word', :with => 'Cactus')
    fill_in('word_class', :with => 'noun')
    fill_in('plural_form', :with => 'Cacti')
    fill_in('actual_definition', :with => 'a succulent plant with typically sharp scales or spines')
    click_button('Add')
    click_link('Home')
    expect(page).to have_content('Cactus')
  end
end
