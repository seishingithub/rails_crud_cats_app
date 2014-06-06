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

  scenario 'User can edit & update cats' do
    visit '/'
    expect(page).to have_content 'Cats!'
    click_on 'Cats!'
    click_on 'Add Cat'
    fill_in 'cat[name]', with: 'Spot'
    fill_in 'cat[color]', with: 'orange'
    click_on 'Create Cat'
    visit '/cats'
    click_on 'Spot'
    expect(page).to have_content 'Spot'
    expect(page).to have_content 'orange'
    click_on 'Update Cat'
    fill_in 'cat[name]', with: 'Spotty'
    fill_in 'cat[color]', with: 'black'
    click_on 'Update Cat'
    expect(page).to have_content 'Spotty'
    expect(page).to have_content 'black'
  end

  scenario 'User can delete cats' do
    visit '/'
    expect(page).to have_content 'Cats!'
    click_on 'Cats!'
    click_on 'Add Cat'
    fill_in 'cat[name]', with: 'Spot'
    fill_in 'cat[color]', with: 'orange'
    click_on 'Create Cat'
    visit '/cats'
    click_on 'Spot'
    expect(page).to have_content 'Spot'
    expect(page).to have_content 'orange'
    click_on 'Delete Cat'
    expect(page).to have_no_content 'Spot'
    expect(page).to have_no_content 'orange'
  end
end