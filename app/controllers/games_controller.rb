class GamesController < ApplicationController
  before_action :set_game,only:[:show,:challenge,:destroy]
  before_action :authenticate_user!,only:[:new,:create,:destroy]
  before_action :are_you_host?,only:[:destroy]


  def index
    @games=Game.includes(:user).order(created_at: "DESC").where(check:false).page(params[:page]).per(5)
  end
  
  def show
  
  end
  
  def new
    @game=Game.new
  end
  
  def create
    @game=Game.new(game_params)
    if @game.save
      flash[:notice]="募集に成功しました"
      redirect_to root_path
    else
      flash[:alert]="募集投稿に失敗しました"
      render :new
    end
  end

  def destroy
    @game.destroy
    flash[:notice]="募集の削除をしました"
    redirect_to games_path
  end

  def challenge
    @game.check=true
    flash[:notice]="申し込みを完了しました"
    redirect_to  controller: :chat_rooms, action: :create
  end

  private
  
  def game_params
    params.require(:game).permit(:title,:gameday,:location,:gamenum_id,:gametime_id,:level_id,:description).merge(user_id:current_user.id)
  end

  def set_game
    @game=Game.find(params[:id])
  end

  def recruiting
    if @game.check
      redirect_to games_path
    end
  end

  def are_you_host?
    unless current_user.id==@game.user_id
      redirect_to games_path
    end
  end
end
