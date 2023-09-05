class ListsController < ApplicationController
  def new
    # Viewへ渡すインスタンス変数に空のModelオブジェクトを生成。
    @list = List.new
  end

  def create
    #すること4つ↓
    # 1&2. データを受け取り新規登録するためのインスタンス作成。
    list = List.new(list_params)
    # 3.データをデータベースに保存するsaveメソッド実行
    list.save
    #4. トップ画面へリダイレクト
    redirect_to '/top'
  end


  def index
  end

  def show
  end

  def edit
  end
  
  private
  #ストロングパラメータ(セキュリティのためつける。privateから書く。最後のendの上に置く)
  def list_params #モデル名_paramsと名付ける
    params.require(:list).permit(:title, :body)
  end
end