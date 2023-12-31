class ListsController < ApplicationController
  def new
    # Viewへ渡すインスタンス変数に空のModelオブジェクトを生成。
    @list = List.new
  end

  def create
      @list = List.new(list_params)
    if @list.save
      flash[:notice] = "投稿に成功しました。"
      redirect_to list_path(@list.id)
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
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

  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
