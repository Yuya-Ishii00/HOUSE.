class ItemsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def create
    @item = current_user.items.build(item_params)
    if @item.save
      flash[:success] = 'アイテムを収納しました'
      redirect_to root_url
    else
      @items = current_user.items.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'アイテムの収納に失敗しました。'
      render 'toppages/index'
    end
  end
  
  def edit
    @item = Item.find(params[:id])
  end
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:success] = 'アイテムを編集しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'アイテムの編集に失敗しました。'
      render 'edit'
    end
  end

  def destroy
    @item.destroy
    flash[:success] = 'アイテムを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def item_params
    params.require(:item).permit(:comment, :category_id)
  end
  
  def correct_user
    @item = current_user.items.find_by(id: params[:id])
    unless @item
      redirect_to root_url
    end
  end
end