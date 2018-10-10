class SessionsController < ApplicationController
before_action :showstate, only: [:show]
before_action :currentu, only: [:home]



  def uauth
    if $currentu=User.find_by(auth: params[:auth])
      redirect_to '/', method: 'get'
      flash[:success]="Welcome #{$currentu.name}!"
      session[:htu_usa]= $currentu.auth
    end
  end


  def home
      #@currentu= $currentu ###
      @joins= ''
      @session= Session.new()
      @sessions= Session.all()
      @nosession="active"
      @iscurrent="disabled"
      @utags=[]
      User.all.each do |u|  #maybe not here, not everytime
        unless u.auth == $currentu.auth
          @utags << [u.auth, u.name]
        end
      end

      #redirect_to 'sessions#home'
      #byebug
  end

  def show

    @session= Session.find params[:id]         #find by id / find by code - for users/invited ++auth
    if @session.tasks.any?
      @tasks=Task.where session_id: @session.id
      @list= true
      @canstart=''
      session[:htu_s] = @session.auth
    else
      @list= false
      @canstart= 'disabled'
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
      #session_params[:tags_as_string]
      create.users_id = $currentu.id
      #create.t= ctags
      #create.invite = params[:invite].to_s
      #byebug
      create.invite << $currentu.auth
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
    params[:session][:invite] ||= []
    params.require(:session).permit(:name, :details, :time, invite:[])
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
