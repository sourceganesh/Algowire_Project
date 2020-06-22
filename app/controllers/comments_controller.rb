class CommentsController < ApplicationController
    before_action :authenticate_user!, except:[:show,:index]
    def create
        @movie = Movie.find(params[:movie_id])
        @comment = @movie.comments.build((params[:comment].permit(:body)))
        @comment[:user_id] = current_user.id
        @comment.save
        redirect_to movie_path(@movie)
    end

    def destroy
        @movie = Movie.find(params[:movie_id])
        @comment = @movie.comments.find(params[:id])
        @comment.destroy
        redirect_to movie_path(@movie)
    end

    def comment_params
        params.require(:comment).permit(:body)
    end
end
