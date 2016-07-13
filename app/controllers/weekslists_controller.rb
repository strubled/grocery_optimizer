class WeekslistsController < ApplicationController
before_action :logged_in_user, only: [:create, :edit, :update, :destroy, :destroy_all]
before_action :correct_user,   only: [:update, :destroy]

  def create
  	
    @weekslist = current_user.weekslists.build(weekslist_params)
    @allitem = current_user.allitems.build(weekslist_params)
    if @allitem.save  && @weekslist.save
      flash[:success] = "Saved " + @weekslist.thing + " to the list!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def edit
    @weekslist = Weekslist.find(params[:id])
  end

  def update
    
    @weekslist = Weekslist.find(params[:id])
    if @weekslist.bought == true
        @weekslist.update(bought: false)
        flash[:warning] = "Whoops, " + @weekslist.thing + " back on the list"
        redirect_to request.referrer || root_url  
    else 
      @weekslist.update(bought: true)
      flash[:success] = "Nice, " + @weekslist.thing + " is off the list!"
      redirect_to request.referrer || root_url 
      end

  end

  def destroy
  	@weekslist.destroy
    flash[:success] = "Deleted " + @weekslist.thing + " from the list."
    redirect_to request.referrer || root_url
  end

  def destroy_all
    Weekslist.where(["user_id = ?", current_user]).destroy_all
    flash[:success] = "Your week's list has been deleted"
    redirect_to request.referrer || root_url
  end


  private

    def weekslist_params
      params.require(:weekslist).permit(:thing, :store, :zone, :amount, :bought)
    end


    def correct_user
      @weekslist = current_user.weekslists.find_by(id: params[:id])
      redirect_to root_url if @weekslist.nil?
    end
end

