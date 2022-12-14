class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  def index
    @recipes = Recipe.all
    if params[:query].present?
      @recipes = Recipe.search_by_name(params[:query])
    end
    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'recipes/list', locals: { recipes: @recipes }, formats: [:html] }
    end
  end

  def show
    @doses = Dose.where(recipe_id: Recipe.find(@recipe.id))
    @rating = Rating.new
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @recipe.update(recipe_params)
    redirect_to recipe_path(@recipe)
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path, status: :see_other
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :instruction, :photo)
  end

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end
end
