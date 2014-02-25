class ChefsController < ApplicationController
  
  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    raise @chef.inspect
  end

  def index

  end

  def update

  end

  private

  def chef_params
    params.require(:chef).permit(:name, :show, :specialty, :avatar)

  end
end


