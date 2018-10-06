class SessionsController < ApplicationController
before_action :showstate, only: [:show]
before_action :currentu, only: [:home]



  def uauth
    if $currentu=User.find_by(auth: params[:auth])
      redirect_to '/', method: 'get'
      flash[:success]="Welcome #{$currentu.name}!"
    end
  end


  def home
      #@currentu= $currentu ###
      @session= Session.new()
      @sessions= Session.all()
      @nosession="active"
      @iscurrent="disabled"

      #redirect_to 'sessions#home'
      #byebug
  end

  def show

    @session= Session.find params[:id]         #find by id / find by code - for users/invited ++auth
    if Task.any?
      @tasks=Task.where session_id: @session.id
      @list= true
    else
      @list= false
    end
    #byebug
    @task= Task.new
    @sessiontypes= [["1", "Consultative"], ["2", "Simple Majority"], ["3","2/3 Majority"], ["4","Consensus"]]

  end


  def index

  end

  def create
      create= Session.new(session_params)
      #byebug
      create.users_id = $currentu.id
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

  def currentu
      if $currentu.class.name == "User" #differ from session -before-fornow
        @currentu= $currentu
      else
        @current= ''
        render partial: 'uauth'
      end

  end

end
