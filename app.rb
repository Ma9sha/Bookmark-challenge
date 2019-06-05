require 'sinatra/base'
require './lib/bookmark'


class Bookmark < Sinatra::Application
  get '/' do
    "Hello World!"
  end

  get '/bookmarks' do
    @bookmark = Book.all
    erb :bookmark
  end

  post '/bookmarks' do
    Book.add_bookmark(params[:urlname], params[:title])
    redirect '/bookmarks'
  end


end
