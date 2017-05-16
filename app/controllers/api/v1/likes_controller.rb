class Api::V1::LikesController < ApplicationController
  def create
    @like = Like.new(like_params)
    if @like.save
      head :created
    else
      render json: @like.errors, status: :unprocessable_entity
    end
  end

  private
  def like_params
    params.require(:like).permit(:positive, :user_uuid, :beer_ext_id)
  end
end
