class CommentsController < ApplicationController
  def new
    
  end
  
  def create
    @account = Account.find_by(id: session[:account_id])
    @article = @account.articles.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    redirect_to account_article_path(@account, @article)
  end
  def destroy
    @account = Account.find_by(id: session[:account_id])
    @article = @account.articles.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
        redirect_to account_article_path(@account, @article)  	
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end
