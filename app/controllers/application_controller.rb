require 'sinatra/base'

class App < Sinatra::Base

  set :views, Proc.new { File.join(root, "../views/") }

  get '/' do
    erb :hero_form
  end

  post '/teams' do

    @team = Team.new(params[:team])

    params[:team][:heroes].each do |hero_details|
      Hero.new(hero_details)
    end

    @heroes = Hero.all

    erb :team
  end
end
