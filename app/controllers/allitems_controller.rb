class AllitemsController < ApplicationController
	before_action :logged_in_user, only: [:create, :edit, :update, :destroy]
	before_action :correct_user,   only: [:update, :destroy]
  
  

  def create
  	
    @allitem = current_user.allitems.build(allitem_params)
    if @allitem.save
      flash[:success] = "Item saved!"
      redirect_to request.referrer || root_url
    else
      @feed_all_items = []
      render 'static_pages/allitems'
    end
  end

  def do_something_if_unique
    @allitem = current_user.allitems.build(allitem_params)
  if self.allitem.exists?(allitem_params)
    # there is a record that exists with this number
        flash[:warning] = "Sorry, boss.  Can't add this one.  It's a dupe!"
        redirect_to root_url
  else
    # there are no records that exist with this number
  end
end

  def edit
    @allitem = Allitem.find(params[:id])
  end


  def update
      @existing_post = Allitem.find(params[:id])
      #create new object with attributes of existing record 
      @weekslist = Weekslist.new(@existing_post.attributes)
      if @weekslist.save 
        flash[:success] = "Item added to this Week's List!"
        redirect_to request.referrer || root_url
    else
      @feed_items = []
      redirect_to request.referrer || root_url
    end
  end

  def destroy
  	@allitem.destroy
    flash[:success] = "Item deleted"
    redirect_to request.referrer || root_url
  end



  private

    def allitem_params
      params.require(:allitem).permit(:thing, :store, :zone, :amount)
    end


    def correct_user
      @allitem = current_user.allitems.find_by(id: params[:id])
      redirect_to root_url if @allitem.nil?
    end
end

