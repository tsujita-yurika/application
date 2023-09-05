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
    #4. トップ画面へリダイレクト→詳細画面へリダイレクトに変更
    # redirect_to '/top'
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
    list = List.find(params[:id]) #データを１件取得
    list.destroy  # データを削除
    redirect_to '/lists' #投稿一覧画面へリダイレクト
  end

  private
  #ストロングパラメータ(セキュリティのためつける。privateから書く。最後のendの上に置く)
  def list_params #モデル名_paramsと名付ける
    params.require(:list).permit(:title, :body)
  end
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end