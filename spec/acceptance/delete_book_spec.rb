require 'acceptance_helper'

RSpec.describe 'Delete book', type: :feature do
  scenario "User deletes a book with an ajax request", js: true do
    add_book

    visit(root_path)

    expect(page).to have_content("Reed")
    expect(page).to have_content("My Book")

    find(".js-btn-remove-book").click

    expect(page).not_to have_content('My Book')
  end
end


