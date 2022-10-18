class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    #データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    #データを保存するためのsaveメソッド
    list.save
    #トップ画面へリダイレクト
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to '/lists'
  end

  private
  # ストロングパラメータ(上記で呼び出し)
  def list_params
    params.require(:list).permit(:title,:body, :image)
  end
end
