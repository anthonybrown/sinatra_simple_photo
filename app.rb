require "sinatra/base"

IMAGES = [
  { title: "Utopia"     , url: "http://www.beautifullife.info/wp-content/uploads/2013/01/23/08.jpg" },
  { title: "Alaska"     , url: "http://www.davidsfotos.com/LANDSCAPESpage_files/LANDSCAPES2.jpg" },
  { title: "The Unknown", url: "http://www.beautifullife.info/wp-content/uploads/2013/01/23/02.jpg" }
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
