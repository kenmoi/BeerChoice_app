class SearchsController < ApplicationController

  def search
    word = params[:word]
    @word = word
    beer_ids = Beer.search(word)
    @sort = params[:keyword]

    if @sort == "many"
      beers = beer_ids.includes(:post_comments).sort {|a,b| b.post_comments.size <=> a.post_comments.size}
    elsif @sort == "likes"
      beers = beer_ids.includes(:favorites).sort {|a,b| b.favorites.size <=> a.favorites.size}
    elsif @sort == "old"
      beers = beer_ids.order(created_at: :asc)
    else
      beers = beer_ids.order(created_at: :desc)
    end
    @beers = Kaminari.paginate_array(beers).page(params[:page]).per(10)
  end

end
