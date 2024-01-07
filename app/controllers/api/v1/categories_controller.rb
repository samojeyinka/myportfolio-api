class Api::V1::CategoriesController < ApplicationController
    before_action :find_params, only: [:show, :update, :destroy]

def index
    @categories = Category.all
    render json: @categories
end

def show
    render json: @category
end

def create
    @category = Category.new(category_params)
    if @category.save
        render json: @category
    else
        render json: @category.errors.full_messages, status: :unprocessable_entity
    end
end

def update
    if @category.update(category_params)
        render json: @category
    else
        render json: @category.errors.full_messages, status: :unprocessable_entity
    end
end

def destroy
    if @category.destroy
        render json: { message: "Deleted successfully" }, status: :ok
    else
        render json: { error: "Unable to delete category" }, status: :unprocessable_entity
    end
end

private

def find_params
    @category = Category.find(params[:id])
end

def category_params
    params.require(:category).permit(:name, :description)
end

end
