require 'sinatra'

class TestApp < Sinatra::Application
  get '/' do
    status 200
  end

  post '/' do
    status 201
  end
end
