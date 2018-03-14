class LittleShopApp < Sinatra::Base
  set :method_override, true
  set :public_folder, 'public'
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

    delete '/merchants/:id' do |id|
      Merchant.destroy(id.to_i)
      redirect '/merchants'
    end
end
