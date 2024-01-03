module Api
    module V1
      class ArticlesController < ApplicationController
        before_action :find_article, only: [:show, :update, :destroy]

        def index
         @articles = Article.all
         render json: @articles, each_serializer: Api::V1::ArticleSerializer
        end

        def show
          render json: @article, serializer: Api::V1::ArticleSerializer
        end

        def create
          @article = Article.new(article_params)
          if @article.save
            render json: @article
          else
              render json: @article.errors.full_messages, status: :unprocessable_entity
          end
        end

        def update
          if @article.update(article_params)
            render json: @article
          else
              render json: @article.errors.full_messages, status: :unprocessable_entity
          end
        end

        def destroy
          if @article.destroy
            render json: { message: "Deleted successfully" }, status: :ok
          else
            render json: { error: "Unable to delete article" }, status: :unprocessable_entity
          end
        end
        
        private

        def find_article
          @article = Article.find(params[:id])
        end


        def article_params
          params.require(:article).permit(:title, :content)
        end
        
      end
    end
  end
  