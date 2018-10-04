class TasksController < ApplicationController

  def create
    create= Task.new(task_params)
    #byebug
    currenthack= "/#current"
     if create.save!
       flash[:success]="Task Created"
       redirect_to "/sessions/#{create.session_id}/#current"  #hardcoded
     end

  #  redirect_to session_path id: create.session.id #hardcoded

    #TYPE :type, NILL
  end
    private

    def task_params
      params.require(:task).permit(:title, :body, :session_id, :type, :link)

    end

end
