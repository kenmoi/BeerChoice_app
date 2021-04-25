class SearchsController < ApplicationController
  def search
    word = params[:word]
    @word = word
    beer_ids = Beer.search(word)
    @sort = params[:keyword]

    beers = if @sort == 'many'
              beer_ids.includes(:post_comments).sort { |a, b| b.post_comments.size <=> a.post_comments.size }
            elsif @sort == 'likes'
              beer_ids.includes(:favorites).sort { |a, b| b.favorites.size <=> a.favorites.size }
            elsif @sort == 'old'
              beer_ids.order(created_at: :asc)
            else
              beer_ids.order(created_at: :desc)
            end
    @beers = Kaminari.paginate_array(beers).page(params[:page]).per(10)
  end
end
