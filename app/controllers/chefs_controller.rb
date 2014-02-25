class ChefsController < ApplicationController


  def new
    @chef = Chef.new
  end

  def show
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


