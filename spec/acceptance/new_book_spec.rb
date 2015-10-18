require 'acceptance_helper'

RSpec.describe 'New Book', type: :feature do
  scenario "User creates a new book via the home page form", js: true do
    visit(root_path)

    expect(page).to have_content("Reed")

    click_link 'Add a Book'

    fill_in 'Title', with: 'My Book'
    fill_in 'Author', with: 'Tiger Shen'
    fill_in 'Description, Summary, Review...', with: 'A literary masterpiece'
    fill_in 'Amazon ID', with: '1234567'
    find('#book_rating').find(:xpath, 'option[4]').select_option

    click_button 'Create Book'

    expect(page).to have_content('My Book')
  end
end

