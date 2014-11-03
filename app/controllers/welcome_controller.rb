class WelcomeController < ApplicationController
  def index

    @json = Event.all.to_gmaps4rails
  end
end
