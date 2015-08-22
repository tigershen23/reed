require 'acceptance_helper'

xpect(page).to have_content("Reed")

    click_link 'Add a Book'

    fill_in 'Title', with: 'My Book'
    fill_in 'Author', with: 'Tiger Shen'
    fill_in 'Description', with: 'A literary masterpiece'
    fill_in 'Amazon ID', with: '1234567'
    choose('5') # Rating

    click_button 'Create Book'

    expect(page).to have_content('Written by Tiger Shen')
  end
end

