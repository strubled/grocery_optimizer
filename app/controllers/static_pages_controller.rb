class StaticPagesController < ApplicationController
  def home
  	    @weekslist = current_user.weekslists.build if logged_in?
  	    @feed_items = current_user.feed.order(:bought, store: :asc, zone: :asc) if logged_in?
        
        @feed_bulkadds = current_user.feed_bulkadds.order(store: :asc, zone: :asc) if logged_in?
        @store = Store.all if logged_in?
        @weekslist_all = Weekslist.all if logged_in?
        @allitem = current_user.allitems.build if logged_in?
  end

  def destroy_all
    Weekslist.destroy_all
    flash[:success] = "Your week's list has been deleted"
    redirect_to request.referrer || root_url
  end

  def unbuy_all
    Weekslist.where(["user_id = ?", current_user]).update_all(bought: false)
    flash[:success] = "You just unbought everything"
    redirect_to request.referrer || root_url
  end

  def bulkadds # this stuff just allows you to show things on the page
    
    @bulkadds = current_user.allitems.build if logged_in?
    @allitem = current_user.allitems.build if logged_in?
    @weekslist = current_user.weekslists.build if logged_in?
    @store = Store.all if logged_in?
    if params[:search]
      @feed_all_items = current_user.feed_all_items.search(params[:search]).order(:store, zone: :asc) if logged_in?
    else
      @feed_all_items = current_user.feed_all_items.order(:store, zone: :asc) if logged_in?

    end

    @store = Store.all if logged_in?
  end 

  def allitems
    @bulkadds = current_user.allitems.build if logged_in?
    @allitem = current_user.allitems.build if logged_in?
    @weekslist = current_user.weekslists.build if logged_in?
    @store = Store.all if logged_in?
    if params[:search]
      @feed_all_items = current_user.feed_all_items.search(params[:search]).order(:store, :zone, thing: :asc) if logged_in?
    else
      @feed_all_items = current_user.feed_all_items.order(:store, :zone, thing: :asc) if logged_in?

    end

    @store = Store.all if logged_in?
  end

  def stores
    @store = current_user.stores.build if logged_in?
    @feed_stores = current_user.feed_stores.order(:store) if logged_in?
  end


  def help
  end

  def about
  end
  def contact
  end
end
