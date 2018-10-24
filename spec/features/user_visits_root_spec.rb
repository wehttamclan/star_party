require 'rails_helper'

describe 'user visits the landing page' do
  scenario 'as a visitor' do
    visit '/'

    expect(page).to have_link "Log In / Sign Up"
    expect(page).to have_button "Find a Party"
    expect(page).to have_button "Plan a Party"
    expect(page).to have_css(".apod")

  end
end
