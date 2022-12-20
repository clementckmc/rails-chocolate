class RatingsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @rating = Rating.new(rating_params)
    @rating.recipe = @recipe
    if @rating.save
      redirect_to recipe_path(@recipe)
    else
      render "recipes/show", status: :unprocessable_entity
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:star)
  end
end
