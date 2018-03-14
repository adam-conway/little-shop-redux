class LittleShopApp < Sinatra::Base
  set :method_override, true
    get '/merchants' do
      @merchants = Merchant.all
      erb :'merchants/index'
    end

    get '/merchants/new' do
      erb :'merchants/new'
    end

    get '/merchants/:id/edit' do
      @merchant = Merchant.find(params[:id])
      erb :'merchants/edit'
      redirect '/merchants'
    end

    get '/merchants/:id' do
      @merchant = Merchant.find(params[:id])
      erb :'merchants/show'
    end

    post '/merchants' do
      merchant = Merchant.new(params[:merchant])
      merchant.save
      redirect '/merchants'
    end
end
