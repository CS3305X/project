require 'spec_helper'

describe 'Event management' do
  scenario 'creates a new event', js: true do
    visit events_path
    click_button('Create Event')

    fill_form(:event, attributes_for(:event))
    click_button('Submit')
    expect(page).to have_content 'Meeting'
  end
end
