class RecipesController < ApplicationController

  def index
    # Code for listing all recipes goes here.
    @recipes = Recipe.all
    @tags = Tag.all
    if params[:search_ingredient]
      @recipes = Recipe.search(params[:search_ingredient])
      render :index
    else
      render :index
    end
  end

  def new
    # Code for new recipe form goes here.
    @recipe = Recipe.new
    render :new
  end

  def create
    # Code for creating a new recipe goes here.
    @recipe = Recipe.new(recipe_params)
    # @tag = @recipe.tags.new(tag_params)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    # Code for edit recipe form goes here.
    @recipe = Recipe.find(params[:id])
    if params[:category]
      category_ids = params[:category].values
      category_ids.each do |id|
        @tag = Tag.find(id)
        @recipe.tags << @tag
      end
        redirect_to recipe_path
    else
      @tags = Tag.all
      render :edit
    end
  end

  def show
    # Code for showing a single recipe goes here.
    @recipe = Recipe.find(params[:id])
    @tags = Tag.all
    render :show
  end

  def update
    # Code for updating an recipe goes here.
    @recipe= Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    # Code for deleting an recipe goes here.
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  # def search
  #   @recipes = Recipe.search(params[:search_ingredient])
  #   redirect_to recipes_path
  # end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :ingredient, :instruction)
    end

end