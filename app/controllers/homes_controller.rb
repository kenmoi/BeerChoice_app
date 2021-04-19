class HomesController < ApplicationController

  def top
    @rate_ranks = Beer.where(id: PostComment.select("beer_id,avg(rate) as average").group(:beer_id).order(avg: :desc).limit(3).pluck(:beer_id))
    @comment_ranks = Beer.find(PostComment.group(:beer_id).order('count(beer_id) desc').limit(3).pluck(:beer_id))
  end

end
