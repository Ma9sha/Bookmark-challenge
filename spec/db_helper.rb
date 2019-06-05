def empty_test_table 

  raise "Warning!!! you are in development environment" if ENV['RACK_ENV'] != 'test'
  connection = PG.connect(dbname: 'bookmark_manager_test')

  connection.exec("TRUNCATE bookmarks;")

  connection.exec("Insert into bookmarks(id,url,title) Values (1, 'http://askjeeves.com','jeeves'),(2, 'http://makersacademy.com','makers'),(3, 'http://google.com', 'google');")
  
end