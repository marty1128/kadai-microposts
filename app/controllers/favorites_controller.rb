class FavoritesController < ApplicationController
  before_action :require_user_logged_in

  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.favor(micropost)
    flash[:success] = 'お気に入り登録しました。'
    redirect_to current_user #今選択しているユーザーのページに戻るならどうすればいいのか？
  end

  def destroy
    micropost = Micropost.find(params[:micropost_id])
    current_user.unfavor(micropost) #Userモデルのunfavorメソッドの書き方を質問する
    flash[:success] = 'お気に入りを解除しました。'
    redirect_to current_user
  end
  
end
