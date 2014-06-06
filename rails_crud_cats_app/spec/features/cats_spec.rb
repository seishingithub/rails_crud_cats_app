require 'spec_helper'

feature 'Crudding cats' do
  scenario 'User can visit new page' do
    visit '/'
    within 'h2' do
      expect(page).to have_content 'Cats!'
    end
  end

  scenario 'User can create cats' do
    visit '/'
    expect(page).to have_content 'Cats!'
    click_on 'Cats!'
    click_on 'Add Cat'
    fill_in 'cat[name]', with: 'Spot'
    fill_in 'cat[color]', with: 'orange'
    click_on 'Create Cat'
    expect(page).to have_content 'Spot'
    expect(page).to have_content 'orange'
  end
end