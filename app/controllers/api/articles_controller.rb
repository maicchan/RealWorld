class Api::ArticlesController < ApplicationController
  # def create
  #   @article = Article.new(article_params)

  #   if @article.save
  #     render json: @article.as_json(only: [:slug, :title, :description, :body, :created_at, :updated_at]), status: :created
  #   else
  #     render json: @article.errors, status: :unprocessable_entity
  #   end
  # end

  # def show
  #   @article = Article.find_by(slug: params[:slug])

  #   if @article
  #     render json: { article: @article.as_json(except: :id) }, status: :ok
  #   else
  #     render json: { error: 'Article not found' }, status: :not_found
  #   end
  # end

  # def update
  #   @article = Article.find_by(slug: params[:slug])

  #   if @article&.update(article_params)
  #     render json: { article: @article.as_json(except: :id) }, status: :ok
  #   else
  #     render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
  #   end
  # end

  # def destroy
  #   @article = Article.find_by(slug: params[:slug])

  #   if @article&.destroy
  #     head :no_content
  #   else
  #     render json: { error: 'Article not found' }, status: :not_found
  #   end
  # end

  # private

  # def article_params
  #   params.require(:article).permit(:title, :description, :body)
  # end

  before_action :set_article, only: [:show, :update, :destroy]

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: article_json(@article), status: :created
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: article_json(@article), status: :ok
  end

  def update
    if @article&.update(article_params)
      render json: article_json(@article), status: :ok
    else
      render json: { errors: @article.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @article&.destroy
      head :no_content
    else
      render json: { error: 'Article not found' }, status: :not_found
    end
  end

  private

  def set_article
    @article = Article.find_by(slug: params[:slug])
    render json: { error: 'Article not found' }, status: :not_found unless @article
  end

  def article_params
    params.require(:article).permit(:title, :description, :body)
  end

  def article_json(article)
    { article: article.as_json(only: :id) }
  end
end
