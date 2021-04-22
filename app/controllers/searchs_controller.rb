class SearchsController < ApplicationController
  
  def search
    word = params[:word]
    @beers = Beer.search(word).order(created_at: :desc).page(params[:page]).per(10)
    # style = params[:style]
    # retailer = params[:retailer]
    
  end
  
end
