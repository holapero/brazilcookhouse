class ChefsController < ApplicationController
  before_action :set_params, only:[:show, :edit, :update, :destroy]

  def new
    @chef = Chef.new
  end

  def create
    @chef = Chef.new(chef_params)
    if @chef.save
      flash[:success] = 'Chef #{@chef.humanize} was saved'
      redirect_to chef_path(@chef.id)
    else
      flash[:error] = 'Chef #{@chef.humanize} was not saved'
      render :new
    end
  end

  def show
  end

  def index
    @chef = Chef.all
  end

  def edit
  end

  def update
    @chef.update_attributes(params[:chef])
  end

  def destroy
    @chef.destroy
    flash[:notice] = "The recipe was remove"
    redirect_to chefs_path
  end

  private

  def chef_params
    params.require(:chef).permit(:name, :show, :specialty, :avatar)
  end
  def set_params
    @chef = Chef.find(params[:id])
  end
end


