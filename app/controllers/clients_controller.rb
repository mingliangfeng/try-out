class ClientsController < ApplicationController
  
  def new
    @client = env['omniauth.identity']
    @client = Client.new unless @client
  end
  
end
