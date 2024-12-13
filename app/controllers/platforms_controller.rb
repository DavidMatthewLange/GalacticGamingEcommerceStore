class PlatformsController < ApplicationController
  def index
    @platforms = Platform.all
  end

  def show
    @platform = Platform.find(params[:id])
    @products = @platform.products # Assuming a `has_many :products` association
  end
end
