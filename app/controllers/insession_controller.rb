class InsessionController < ApplicationController
include InsessionHelper
before_action :setvar


def started
  if !@hassession.empty?
    genqr(@hassession, @master)
    @user= User.find_by(auth: @master)
    @insession= Sessionrecord.create(joincode: @jcode, session_id: Session.find_by(auth: @hassession).id, userauth: @master)
    @session= @insession.session
    #byebug #verify if insessin not set to true
  elsif @joinscode
    setsession(@joinscode)
  else
    flash[:error]= "Invalid Session"
    redirect_to '/'
  end
end


def joins
  if Sessionrecord.find_by(joincode: @joinscode)
  redirect_to  insession_path
  else
  flash[:error]= "Code Invalid"
  redirect_to '/'
  end
end

### API ######

def apijoins

end

def sessionaction
  #code
end

def sessiondata

end







### END API ####


def setvar
  @master= session[:htu_usa]
  @hassession= session[:htu_s]
  @joinscode= Sessionrecord.new(joincode: params[:code]).joincode
  #@accesscode=
end



end
