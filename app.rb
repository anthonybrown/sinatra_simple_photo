require "sinatra/base"

IMAGES = [
  { title: "Utopia"     , url: "http://www.beautifullife.info/wp-content/uploads/2013/01/23/08.jpg" },
  { title: "Alaska"     , url: "http://www.davidsfotos.com/LANDSCAPESpage_files/LANDSCAPES2.jpg" },
  { title: "The Unknown", url: "http://www.beautifullife.info/wp-content/uploads/2013/01/23/02.jpg" }
]

class App < Sinatra::Base
  
  get '/images' do
    @images = IMAGES
    erb :images
  end

  get '/images/:index' do |index|
    index = index.to_i
    @image = IMAGES[index]

    haml :"images/show", layout: true
  end

  get '/' do
    "Hello World"
  end
  
  post '/' do
    "Hello via POST"
  end

  put '/' do
    "Hello via PUT"
  end

  delete '/' do
    "Goodbye World via DELETE"
  end

  get '/hello/?:first_name?/?:last_name?' do |first, last|
    "hello #{first} #{last}"
  end
end
