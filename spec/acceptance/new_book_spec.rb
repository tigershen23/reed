require 'acceptance_helper'

RSpec.describe 'New Book', type: :feature do
  scenario "User creates a new book via the home page form", js: true do
    add_book

    expect(page).to have_content('My Book')
  end
end

