describe '.all' do
  it 'returns a list of bookmarks' do
    bookmark = Book.all
    expect(bookmark[0].url).to include "http://askjeeves.com"
    expect(bookmark[1].title).to include "makers"
  end
end

describe '.delete' do
  it 'can delete a bookmark' do
    bookmark1 = Book.all
    Book.delete(bookmark1[0].id)
    bookmark2 = Book.all
    expect(bookmark1.length).to eq(bookmark2.length+1)

  end
end

describe 'update the bookmarks' do
  it 'should allow to update an existing bookmark' do
    bookmark = Book.all
    Book.update(bookmark[2].id, "http://google.co.uk", "google")
    bookmark = Book.all
    expect(bookmark[2].url).to eq "http://google.co.uk"
  end
end
