require 'sinatra'
require 'json'

class TestApp < Sinatra::Application
  get '/' do
    status 200
  end

  post '/' do
    response = { 'some_param' => params['some_param'],
                 'im_a_number' => params['im_a_number'] }
    status 201

    return response.to_json
  end

  put '/' do
    response = { 'some_param' => params['some_param'],
                 'im_a_number' => params['im_a_number'] }
    status 202

    return response.to_json
  end

  get '/json' do
    return { 'key' => 1 }.to_json
  end

  post '/json' do
    request.body.rewind
    body = JSON.parse(request.body.read)

    status 201
    return body.to_json
  end

  delete '/json' do
    request.body.rewind
    body = JSON.parse(request.body.read)

    if body['some_key'] == 'some_value'
      status 203
    else
      halt 400
    end
  end

  get '/redirect' do
    redirect to '/'
  end

  # For testing Timefreeze in Cukes
  get '/time' do
    time = Time.now.to_i

    return { 'time' => time }.to_json
  end

  get '/route/:uri_var' do |uri_var|
    return { 'variable' => uri_var }.to_json
  end
end
