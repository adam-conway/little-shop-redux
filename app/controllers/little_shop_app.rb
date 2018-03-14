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

    put '/merchants/:id' do |id|
      Merchant.update(id.to_i, params[:merchant])
      redirect "/merchants/#{id}"
    end


    get '/items' do
      @items = Item.all
      erb :'items/index'
    end

    get '/items/new' do
      erb :'items/new'
    end

    get '/items/:id/edit' do
      @item = Item.find(params[:id])
      erb :'items/edit'
    end

    get '/items/:id' do
      @item = Item.find(params[:id])
      erb :'items/show'
    end

    post '/items' do
      item = Item.new(params[:item])
      item.save
      redirect '/items'
    end

    put '/items/:id' do |id|
      Item.update(id.to_i, params[:item])
      redirect "/items/#{id}"
    end
end
