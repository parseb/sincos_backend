class SessionsController < ApplicationController

##public session="" #this session if in session
$state= {
      nosession:'active',
      iscurrent:'disabled',
      sessionid: ''}

  def home
    @session= Session.new()
    @sessions= Session.all()
    @nosession=$state['nosession']
    @iscurrent=$state['iscurrent']
  end


  def index

  end

  def create
      create= Session.new(session_params)
      #byebug
      create.save!
      ##if Session.last.created_at == session_params[:created_at]
      #params[:session] == Session.last #delay?
      $state['iscurrent']='active'
      $state['nosession']='disabled'
      #@state.sessionid= session_params[:id]
      redirect_to '/', alert: "Session #{'last'} Created" #hardcoded
  end

  private
  def session_params
    params.require(:session).permit(:name, :details, :time, :invite)
  end
end
