require('sinatra')


get '/days' do
  @days = Day.all
  erb(:days)
end

post '/days' do
  id = params['day_id']
  redirect "/days/#{id}"
end

get '/days/:id' do 

end
