feature 'to get to homepage' do
  scenario 'to display string Hello World' do
    visit('/')
    expect(page).to have_content("Hello World!")
  end
end

feature 'viewing bookmarks' do
  scenario 'view bookmarks on page' do
    visit('/bookmarks')
    expect(page).to have_content("http://askjeeves.com", "jeeves")
  end
end

feature "add new bookmarks" do
  scenario 'allows users to add a new bookmark' do
    visit('/bookmarks')
    fill_in :urlname, with: "http://bbc.co.uk"
    fill_in :title, with: "bbc"
    click_on("Add")
    expect(page).to have_content("bbc")
    end
  end

  feature 'can delete a bookmark' do
    scenario 'can delete a choosen bookmark' do
      visit('/bookmarks')
      click_on("Delete google")
      expect(page).to have_no_content('google')
       end
  end

  feature 'can update a bookmark' do
    scenario 'can update a choosen bookmark' do
      visit('/bookmarks')
      click_on("Update jeeves")
      
      fill_in :urlname, with: 'http://ask.com'
      click_on("Update")
      expect(page).to have_selector(:css, 'a[href="http://ask.com"]')
       end
  end