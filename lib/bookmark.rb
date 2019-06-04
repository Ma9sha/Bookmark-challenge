require 'pg'

class Book

# attr_reader :bookmarks

  def self.all
  connect = connection()   
  result = connect.exec("SELECT * FROM bookmarks;")
  result.map {|bookmark| bookmark['url']}
  end

  def self.add_bookmark(bookmark)
    connect = connection
    connect.exec("Insert into bookmarks(url) values ('#{bookmark}');")
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
