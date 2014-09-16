require 'sinatra'
require 'kramdown'

set :static, false

get '/article/:title/' do
  article_source = File.read(File.join('articles', params[:title], "article.md"))
  Kramdown::Document.new(article_source).to_html
end

get '/article/:title/:file' do
  send_file File.join('articles', params[:title], params[:file]), disposition: 'inline'
end

run Sinatra::Application
