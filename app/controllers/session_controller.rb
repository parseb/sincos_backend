class SessionController < ApplicationController

##public session="" #this session if in session

  def home
    @session= Session.new()
    @sessions= Session.all()


    @nosession='active'
    @iscurrent='disabled'
  end


  def index

  end

  def create
  end
end
