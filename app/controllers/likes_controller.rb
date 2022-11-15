class LikesController < ApplicationController
    # before_action :authenticate_user!

    def create
        @like = (current_user ? current_user.likes.new(like_params):nil)
        # @like = Like.new(like_params)
        if @like
            if !@like.save
                flash[:notice] = @like.errors.full_messages.to_sentence
            end
            redirect_to @like.regex
        else
            flash[:notice] = "only users can do this!"
            redirect_to login_path
        end
        
    end
    
    def destroy
        @like = current_user.likes.find(params[:id])
        # @like = Like.find(params[:id])
        regex = @like.regex
        @like.destroy
        redirect_to regex
    end

    private
    
    def like_params
        params.require(:like).permit(:regex_id)
        # params.permit(:regex_id)
    end
end
