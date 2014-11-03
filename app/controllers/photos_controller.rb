class PhotosController < ApplicationController
	before_action :set_photo, only: [:show, :edit, :update, :destroy]
	before_action :authenticate, except: [:index, :show]

	def index
		@photos = Photo.all
	end
	
	def new
		@photo = Photo.new
	end

	def create
		@photo = Photo.new(photo_params)
		if @photo.save
			redirect_to @photo
		else
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @photo.update(photo_params)
			redirect_to @photo
		else
			render 'edit'
		end
	end

	def destroy
	    @photo.destroy
	    respond_to do |format|
	      format.html { redirect_to photos_url, notice: 'Photo was successfully destroyed.' }
	      format.json { head :no_content }
	    end
  	end

	private

	def set_photo
		@photo = Photo.find(params[:id])
	end

	def photo_params
		params.require(:photo).permit(:title, :caption, :link)
	end

	def authenticate
      authenticate_or_request_with_http_basic do |name, password|
        name == Settings::ADMIN_NAME && password == Settings::ADMIN_PASSWORD
      end
    end
end
