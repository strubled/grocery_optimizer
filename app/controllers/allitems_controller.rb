class AllitemsController < ApplicationController
	before_action :logged_in_user, only: [:create, :edit, :search, :update, :destroy]
	before_action :correct_user,   only: [:update, :search, :destroy]



  def create

    @allitem = current_user.allitems.build(allitem_params)
    if @allitem.save
      flash[:success] = "Saved " + @allitem.thing + " to the list!"
            redirect_to request.referrer || root_url
    else
     flash[:danger] = "Can't be empty and can't save duplicates"
     redirect_to request.referrer || root_url
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

    @allitem = Allitem.find(params[:id])
    @allitem.assign_attributes(allitem_params)

    if @allitem.changed? == true
    if @allitem.thing_changed? == true || @allitem.store_changed? == true || @allitem.zone_changed? == true || @allitem.amount_changed? == true
      @allitem.update(allitem_params)
          flash[:success] = @allitem.thing + " has been updated"
          redirect_to request.referrer || root_url
      else
        @allitem.update(allitem_params)
      #create new object with attributes of existing record
        @weekslist = Weekslist.new(@allitem.attributes)
      if @weekslist.save
        flash[:success] = "Item added to this Week's List!"
        redirect_to root_path

      end

     end
   else
    flash[:success] = "No changes were made"
        redirect_to root_url
   end

  end

  def destroy
  	@allitem.destroy
    flash[:success] = "Item deleted"
    redirect_to request.referrer || root_url
  end



  private

    def allitem_params
      params.require(:allitem).permit(:thing, :store, :zone, :amount, :onweekslist)
    end


    def correct_user
      @allitem = current_user.allitems.find_by(id: params[:id])
      redirect_to root_url if @allitem.nil?
    end
end
