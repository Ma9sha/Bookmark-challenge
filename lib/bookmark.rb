require 'pg'

class Book

attr_reader :id, :url, :title

def initialize(id, url, title)
  @id = id
  @url = url
  @title = title
end

  def self.all
  list = []
  connect = connection()   
  result = connect.exec("SELECT * FROM bookmarks;")
  result.each do |bookmark| 
    list << Book.new(bookmark['id'], bookmark['url'], bookmark['title'])
  end
  return list
  end

  def self.add_bookmark(bookmark, title)
    connect = connection
    connect.exec("Insert into bookmarks(url, title) values ('#{bookmark}','#{title}');")
  end

  def self.delete(id)
    connect = connection
    connect.exec("DELETE FROM bookmarks WHERE id = #{id};")
  end

  def self.update(id, url, title)
    connect = connection
    connect.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}' where id = #{id};")
  end

  def self.find(id)
    connect = connection
    bookmark = connect.exec("SELECT * FROM bookmarks WHERE id = #{id};")
    Book.new(bookmark[0]['id'], bookmark[0]['url'], bookmark[0]['title'])
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
