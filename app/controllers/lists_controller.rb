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
    redirect_to '/top'
  end

  def index
  end

  def show
  end

  def edit
  end

  private
  # ストロングパラメータ(上記で呼び出し)
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
