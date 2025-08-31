class ArticlesController < ApplicationController
  def index
    byebug
    @articles = Article.all
  end
end
