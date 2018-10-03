class SessionsController < ApplicationController
before_action :showstate, only: [:show]



  def home
    @session= Session.new()
    @sessions= Session.all()
    @nosession="active"
    @iscurrent="disabled"
    #byebug
  end

  def show

    @session= Session.find params[:id]         #find by id / find by code - for users/invited ++auth

    #byebug
  end


  def index

  end

  def create
      create= Session.new(session_params)
      #byebug
       if create.save!
         flash[:success]="Session Created"
       end
      ##if Session.last.created_at == session_params[:created_at]
      #params[:session] == Session.last #delay?
      #$state[:iscurrent]='active'
      #$state[:nosession]='disabled'
      #@state.sessionid= session_params[:id]

      redirect_to action: 'show', id: create.id #hardcoded

  end

  private
  def session_params
    params.require(:session).permit(:name, :details, :time, :invite)
  end

  def showstate
    @nosession='disabled'
    @iscurrent='active'
     #this is bad
  end
end
