module BookHelpers
  def add_book
    visit(root_path)

    expect(page).to have_content("Reed")

    click_link 'Add a Book'

    fill_in 'Title', with: 'My Book'
    fill_in 'Author', with: 'Tiger Shen'
    fill_in 'Description, Summary, Review...', with: 'A literary masterpiece'
    fill_in 'Amazon ID', with: '1234567'
    find('#book_rating').find(:xpath, 'option[4]').select_option

    click_button 'Create Book'
  end
end
