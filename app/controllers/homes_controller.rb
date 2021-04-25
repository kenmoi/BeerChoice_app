class HomesController < ApplicationController
  def top
    @rate_ranks = Beer.find(PostComment.group(:beer_id).order('avg(rate) desc').limit(3).pluck(:beer_id))
    @comment_ranks = Beer.find(PostComment.group(:beer_id).order('count(beer_id) desc').limit(3).pluck(:beer_id))
  end

  def score
    @beers = Beer.find(PostComment.group(:beer_id).order('avg(rate) desc').limit(20).pluck(:beer_id))
  end
end
