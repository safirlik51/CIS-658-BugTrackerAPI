class BugsController < ApplicationController
	before_action :set_user
	before_action :set_user, only: [:show, :update, :destroy]

	# GET /userss/:user_id/bugs
   def index
     json_response(@user.bugs)
   end
     
   # GET /users/:user_id/bugs/:id
   def show
     json_response(@bug)
   end
     
   # bug /users/:user_id/bugs
   def create
     @user.bugs.create!(bug_params)
     json_response(@user, :created)
   end
     
   # PUT /users/:user_id/bugs/:id
   def update
     @bug.update(bug_params)
     head :no_content
   end
     
   # DELETE /users/:user_id/bugs/:id
   def destroy
     @bug.destroy
     head :no_content
   end
     
   private
     
   def bug_params
     params.permit(:title, :article, :likes, :status)
   end
     
   def set_user
     @user = user.find(params[:user_id])
   end
     
   def set_user_bug
     @bug = @user.bugs.find_by!(id: params[:id]) if @user
   end
end
