class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredients = Ingredient.all
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    params[:ingredients].each_with_index do |ingredient, index|
      @dose = Dose.new(recipe: @recipe, ingredient_id: ingredient.to_i, amount: params[:amount][index].to_i)
      render :new, status: :unprocessable_entity unless @dose.save
    end
    redirect_to recipe_path(@recipe)
  end

  private

  def dose_params
    params.require(:dose).permit(:ingredient_id, :amount)
  end
end
