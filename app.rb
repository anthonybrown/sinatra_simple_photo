require "sinatra/base"

IMAGES = [
  { title: "Kate"     ,   url: "http://mankindunplugged.com/wp-content/uploads/2013/08/kate-upton-elle-magazine-3.jpg" },
  { title: "Kate",        url: "http://mankindunplugged.com/wp-content/uploads/2013/08/kate-upton-elle-magazine-2.jpg" },
  { title: "Hotness",     url: "http://mankindunplugged.com/wp-content/uploads/2013/08/sexy-photo-infinity-pool-action.jpg" },
  { title: "Irena",       url: "http://mankindunplugged.com/wp-content/uploads/2013/08/Irina-Shayk-GQ-Russia-10.jpg" },
  { title: "Blonde",      url: "http://i.imgur.com/oU2EFrb.png" },
  { title: "Alabama",     url: "http://i.imgur.com/QRuVCWK.png" },
  { title: "Cowgirl",     url: "http://i.imgur.com/fGJClQ8.png" },
  { title: "The Unknown", url: "http://24.media.tumblr.com/4fe1022e30778b6ce7d92ff1213e0ad4/tumblr_mponkeQPiL1r1of71o1_1280.png" },
  { title: "Kitten",      url: "http://i.imgur.com/ksUeQGn.jpg" }

]

class App < Sinatra::Base
    
  enable :sessions

  before /images/ do
    @message = "You are viewing an image"
  end
  
  before do
    @user = "Tony Brown"
    @height = session[:height]
    puts "==> Entering Request"
  end
  
  after do
    puts " <== Leaveing Request"
  end

  get "/sessions/new" do
    erb :"sessions/new"
  end

  post "/sessions" do
    session[:height] = params[:height]
    #puts request.inspect
  end
  
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
    erb :hello, layout: true
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
  
  #pay attention to this
  get '/hello/?:first_name?/?:last_name?/?:what?' do |first, last, what|
    "hello #{first} #{last} #{what}"
  end
end
