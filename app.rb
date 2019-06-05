require 'sinatra/base'
require './lib/bookmark'


class Bookmark < Sinatra::Application
  enable :method_override

  get '/' do
    "Hello World!"
  end

  get '/bookmarks' do
    
    @bookmark = Book.all
    erb :bookmark
  end

  post '/bookmarks' do
    Book.add_bookmark(params[:urlname], params[:title])
    redirect to('/bookmarks')
  end

  delete '/bookmarks/:id' do
    Book.delete(params[:id])
    redirect to('/bookmarks')
  end

  get '/bookmarks/:id/update' do
    @found = Book.find(params[:id])
    erb :update
  end

  patch '/bookmarks/:id/update' do
    Book.update(params[:id], params[:urlname], params[:title])
    redirect to('/bookmarks')
end
end
