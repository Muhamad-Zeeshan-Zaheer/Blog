class CommentsController < ApplicationController
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to article_path(@article)
  end

  def destroy
    @article=Article.find(params[:article_id])
    @comment=@article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article), status: :see_other
  end

  def edit
    @article=Article.find(params[:article_id])
    @comment = Comment.find(params[:id])

  end 
  def update
    @comment = Comment.find_by_id(params[:id])
    @comment.update(comment_params)
    flash[:notice] = "Comment updated."
    redirect_to article_path
  end

  private
    def comment_params
      params.require(:comment).permit(:title, :body, :status)
    end
end