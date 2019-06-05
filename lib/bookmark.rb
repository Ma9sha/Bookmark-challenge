require 'pg'

class Book

# attr_reader :bookmarks

  def self.all
  list = []
  connect = connection()   
  result = connect.exec("SELECT * FROM bookmarks;")
  result.each do |bookmark| 
    list << bookmark
  end
  return list
  end

  def self.add_bookmark(bookmark, title)
    connect = connection
    connect.exec("Insert into bookmarks(url, title) values ('#{bookmark}','#{title}');")
  end

  private
  def self.connection
    if ENV['RACK_ENV'] == 'development'
      return PG.connect(dbname: 'bookmark_manager')
        else
          return PG.connect(dbname: 'bookmark_manager_test')
        end 
    end
end
