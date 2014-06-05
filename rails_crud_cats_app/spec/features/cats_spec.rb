require 'spec_helper'

feature 'Crudding cats' do
  scenario 'User can visit index page' do
    visit '/'
    within 'h2' do
      expect(page).to have_content 'Cats!'
    end

  end
end