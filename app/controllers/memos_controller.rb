class MemosController < ApplicationController
  def index
    @user = current_user
    @memo = Memo.new
    # @memos = Memo.all.order("created_at DESC")
    
    # @memos = Memo.find(user_id: @user.id)
    @memos = Memo.all.where(user_id: @user.id).order("created_at DESC")

  end

  def create
    Memo.create(memo_params)
    redirect_to user_path(current_user.id)
  end

  def destroy
    @user = current_user
    @memo = Memo.find(params[:id])
    @memo.destroy
    redirect_to user_path(current_user.id)
    # if @memos.save
    #  redirect_to user_memo_path
    # end
  end


  private
  def memo_params
    params.require(:memo).permit(:content).merge(user_id: current_user.id)
  end

  def set_group
    @memo = Memo.find(params[:id])
  end
end
  