class ToppagesController < ApplicationController
  def index
    if logged_in?
      @user = current_user
      @item = current_user.items.build  # form_for 用
      @items = current_user.items.order('created_at DESC').page(params[:page])
    end
  end
end
