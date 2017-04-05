require('sinatra')


get '/days' do
  @days = Day.all
  erb(:"/days/days")
end

post '/days' do
  id = params['day_id']
  redirect "/days/#{id}"
end

get '/days/:id' do
  @day = Day.find(params[:id])
  @deals = Day.find_deals(params[:id])
  erb(:"/days/day_deals")
end
