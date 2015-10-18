require 'acceptance_helper'

RSpec.describe 'Edit book', type: :feature do
  scenario "User edits a book using the book edit modal", js: true do
    add_book

    visit(root_path)

    expect(page).to have_content("Reed")
    expect(page).to have_content("My Book")

    find(".edit-book-btn").click

    fill_in 'Title', with: 'New Title'

    click_button 'Update Book'

    expect(page).to have_content('New Title')
  end
end

