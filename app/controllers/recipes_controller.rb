class RecipesController < ApplicationController

  before_action :set_params, only:[:show, :edit, :update, :destroy]

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save

      flash[:success] = 'The recipe was saved'
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = 'The recipe was not saved'
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
    flash[:notice] = "The recipe was removed"
    redirect_to recipes_path
  end

  def update
    @recipe.update_attributes(recipe_params)
    if @recipe.save
      flash[:success] = 'Recipe was saved'
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = 'Recipe was not saved'
      render :new
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :cook_time, :description, :instructions, :picture, :ingredients, :chef_id, :updated_at, :created_at)
  end
  def set_params
    @recipe = Recipe.find(params[:id])
  end

end




