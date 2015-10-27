class ItemsController < ApplicationController

  def index
  	@items = Item.all
  end

	def show
	  @item = Item.find(params[:id])
	end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :redirect, location: item_url(@item, format: :html ) }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
	  @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:name, :image)
  end

end