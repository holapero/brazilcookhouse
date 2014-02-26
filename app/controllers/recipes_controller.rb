class RecipesController < ApplicationController

  before_action :set_params, only:[:show, :edit, :update, :destroy]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save

      flash[:success] = 'recipe #{@recipe.title} was saved'
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = 'recipe #{@recipe.title} was not saved'
      render :new
    end
  end

  def index
    @recipe = Recipe.all
  end

  def show
  end

  def edit
  end

  def destroy
    @recipe.destroy
    flash[:notice] = "The recipe was remove"
    redirect_to recipes_path
  end

  def update
    @recipe.update_attributes(recipe_params)
    if @recipe.save
      flash[:success] = 'recipe #{@recipe.title} was saved'
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = 'recipe #{@recipe.title} was not saved'
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :cook_time, :description, :instructions, :picture, :ingredients)
  end
  def set_params
    @recipe = Recipe.find(params[:id])
  end

end




