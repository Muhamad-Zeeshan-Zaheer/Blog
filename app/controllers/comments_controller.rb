class CommentsController < ApplicationController
  http_basic_authenticate_with(name: ENV["BASIC_AUTH_USER"], password: ENV["BASIC_AUTH_PASSWORD"], except: %i[index show])
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end


  private
    def comment_params
      params.require(:comment).permit(:title, :body, :status)
    end
end
