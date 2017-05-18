class HomesController < ApplicationController
  def home
    cookies[:user_uuid] ||= SecureRandom.hex
  end
end