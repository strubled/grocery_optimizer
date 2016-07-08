class StoresController < ApplicationController
	before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
	before_action :correct_user,   only: [:update, :destroy]

  def create
  	
    @store = current_user.stores.build(store_params)
    if @store.save
      flash[:success] = "Store saved!"
      redirect_to request.referrer || root_url
    else
      @feed_items = []
      render 'static_pages/store'
    end
  end

  def edit
    @store = Store.find(params[:id])
  end

  def update

  end

  def destroy
  	@store.destroy
    flash[:success] = "Store deleted"
    redirect_to request.referrer || root_url
  end



  private

    def store_params
      params.require(:store).permit(:store)
    end


    def correct_user
      @store = current_user.stores.find_by(id: params[:id])
      redirect_to root_url if @store.nil?
    end
end
