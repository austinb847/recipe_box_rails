class TagsController < ApplicationController

  # def index
  #   @tags = Tags.all
  #   render :index
  # end

  def new
    @tag = Tag.new
    render :new
  end

  def create
    # Code for creating a new recipe goes here.
    @tag = Tag.new(tag_params)
    # @tag = @tag.tags.new(tag_params)
    if @tag.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    # Code for edit tag form goes here.
    @tag = Tag.find(params[:id])
    render :edit
  end

  def show
    # Code for showing a single recipe goes here.
    @tag = Tag.find(params[:id])
    @recipes = @tag.recipes
    render :show
  end

  def update
    # Code for updating an tag goes here.
    @tag= Tag.find(params[:id])
    if @tag.update(tag_params)
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    # Code for deleting an tag goes here.
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to recipes_path
  end


  private
    def tag_params
      params.require(:tag).permit(:category)
    end
end