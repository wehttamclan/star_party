require 'rails_helper'

describe 'user visits the landing page' do
  scenario 'as a visitor' do
    VCR.use_cassette("visit root") do
      visit '/'
    end

    expect(page).to have_link "Log In / Sign Up"
    expect(page).to have_button "Find a Star Party"
    expect(page).to have_button "Plan a Star Party"
    expect(page).to have_link "About this photo. NASA"

  end
end
