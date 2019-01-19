class PlacesController < ApplicationController
  def show
  	@place = Place.find(params[:id])
  end

  def new
  	@place = Place.new
  end

  def create
  	@place = Place.new(place_params)
  	if @place.save
  		flash[:success] = '新規投稿が成功しました'
  		redirect_to place_path
  	else
  		render 'new'
  	end
  end

  def edit
  	@place = Place.find(params[:id])
  end

  def update
  	@place = Place.find(params[:id])
  	@place.update(place_params)
  	if @place.save
  		flash[:success] = "編集しました"
  		redirect_to place_path
  	else
  		render 'edit'
  	end
  end

  private

  def place_params
  	params.require(:place).permit(:place_name, :place_description, :place_image)
end
