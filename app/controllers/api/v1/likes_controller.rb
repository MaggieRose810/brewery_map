class Api::V1::LikesController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @like = Like.new(like_params.reverse_merge(user_uuid: cookies[:user_uuid]))
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
