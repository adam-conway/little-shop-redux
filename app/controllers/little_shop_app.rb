class LittleShopApp < Sinatra::Base
    set :method_override, true
    get '/merchants' do
      @merchants = Merchant.all
      erb :'merchants/index'
    end
end
