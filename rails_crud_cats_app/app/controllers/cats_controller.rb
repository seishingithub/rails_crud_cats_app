class CatsController < ApplicationController
  def index
   @cats = Cat.all
  end

  def new
    @cat = Cat.new
  end

  def create
    @cat = Cat.create(secure_params)
    redirect_to cats_path
  end

  private

  def secure_params
    params.require(:cat).permit(:name, :color)
  end
end