class InsessionController < ApplicationController
include InsessionHelper
require 'digest'

before_action :setvar, only: :joins # IDEA: refactor
before_action :starts,  only: :started


## # IDEA: Create an exit button on insession after start to clear session[] vars. Rejoins from Archive / MySessions

  def started
    # @insession
    # @sesdata
    # byebug
    #print @insession.id
    #print @sesdata.name
    @user= User.find_by(auth: session[:htu_usa])


  end

  def joins

    @jcode= Sessionrecord.find_by(joincode: @joincode)
    if @jcode
      #Sessionrecord.find_by(joincode: @joincode) || @jcode && (Session.find_by(auth: @session).invite.include? @user.auth)
      redirect_to  insession_path
    else
       flash[:error]= "Not invited"
       redirect_to '/'
    end
  end


  def starts
    byebug
    unless session[:htu_s]

      @insession= Sessionrecord.find_by(joincode: params[:code])
      @sesdata= Session.find(@insession.session_id)
    end
  end


  def setvar
    @master= session[:htu_usa]
    @session= session[:htu_s]
    #@joincode = params[:code] not accessible

    @code= Sessionrecord.new(joincode: params[:code])
    @joincode= @code.joincode
    #byebug
    if @master && @session
      genqr(@master, @session)
      @sesdata=Session.find_by(auth: @session)
      @insession= Sessionrecord.create(session_id: @sesdata.id, joincode: @jcode) #@jcode in helper
    end


    # if @sesdata=Session.find_by(auth: @session)
    #    @insession= Sessionrecord.create(session_id: @sesdata.id, joincode: @jcode)
    #
    # else
    #   @insession= Sessionrecord.find_by(joincode: params[:code])  #a bit duplicate from joins.. can refactor.         #code
    #   @sesdata= Session.find(@insession.session_id)
    # end
    print @jcode
    @@user= User.find_by(auth: @master )
  end

end
