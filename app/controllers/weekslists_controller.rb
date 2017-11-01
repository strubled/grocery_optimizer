class WeekslistsController < ApplicationController
before_action :logged_in_user, only: [:create, :edit, :bulkadd, :update, :destroy, :destroy_all]
before_action :correct_user,   only: [:update, :edit, :bulkadd, :bought, :destroy]

  def create
  	
    @weekslist = current_user.weekslists.build(weekslist_params)
    @allitem = current_user.allitems.build(weekslist_params)
    if @allitem.save  && @weekslist.save
      flash[:success] = "Saved " + @weekslist.thing + " to the list!"
      redirect_to root_url
    else
      flash[:danger] = "Can't be empty and can't save duplicates"
      redirect_to root_url
    end
  end

  def bulkadd
    @weekslist = current_user.weekslists.build(weekslist_params)
    if @weekslist.save
      flash[:success] = "Saved " + @weekslist.thing + " to the list!"
      redirect_to root_url
    else
      flash[:danger] = "Can't be empty and can't save duplicates"
      redirect_to root_url
    end
  end


  def edit
    @weekslist = Weekslist.find(params[:id])
    @allitems = Weekslist.find(params[:id])
    @store = Store.all if logged_in?
  end 

  def update
    
    @weekslist = Weekslist.find(params[:id])
    @allitems = Allitem.find(params[:id])
    @weekslist.assign_attributes(weekslist_params)
    
    if @weekslist.changed? == true
    
      if @weekslist.thing_changed? == true || @weekslist.store_changed? == true || @weekslist.zone_changed? == true || @weekslist.amount_changed? == true
      
      if @weekslist.update(weekslist_params) && @allitems.update(weekslist_params)
          flash[:success] = @weekslist.thing + " has been updated" 
          redirect_to root_url 
      else 
        flash[:danger] = "Can't be empty and can't save duplicates"
        redirect_to root_url
    end
      else
        @weekslist.update(weekslist_params)
      if @weekslist.bought == false
        flash[:success] = @weekslist.thing + " is back on the list"
        redirect_to root_url
      else
        flash[:success] = @weekslist.thing + " is off the list!"
        redirect_to root_url
      end
 
     end 
   else
    flash[:success] = "No changes were made"
        redirect_to root_url
   end

  end

  def destroy
  	@weekslist.destroy
    flash[:success] = "Deleted " + @weekslist.thing + " from the list."
    redirect_to request.referrer || root_url
  end

  def destroy_all
    Weekslist.where(["user_id = ?", current_user]).destroy_all
    Allitem.where(["user_id = ?", current_user]).update_all(onweekslist: false)
    flash[:success] = "Your week's list has been deleted"
    redirect_to request.referrer || root_url
  end

    def unbuy_all
    Weekslist.where(["user_id = ?", current_user]).update_all(bought: false)
    flash[:success] = "You just unbought everything"
    redirect_to request.referrer || root_url
  end


  private

    def weekslist_params
      params.require(:weekslist).permit(:thing, :store, :zone, :amount, :bought, :onweekslist)
    end


    def correct_user
      @weekslist = current_user.weekslists.find_by(id: params[:id])
      redirect_to root_url if @weekslist.nil?
    end
end

