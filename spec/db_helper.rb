def empty_test_table 

  raise "Warning!!! you are in development environment" if ENV['RACK_ENV'] != 'test'
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE TABLE bookmarks;")

  connection.exec("Insert into bookmarks(id,url) Values (1, 'http://askjeeves.com'),(2, 'http://makersacademy.com'),(3, 'http://google.com');")
  
end