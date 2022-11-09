class LikesController < ApplicationController
    def create
        # @like = current_user.likes.new(like_params)
        @like = Like.new(like_params)
        if !@like.save
            flash[:notice] = @like.errors.full_messages.to_sentence
        end

        redirect_to @like.regex
    end
    
    def destroy
        # @like = current_user.likes.find(params[:id])
        @like = Like.find(params[:id])
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
