class IncomesController < ApplicationController

  def new
    @income = Income.new
  end

  def create
    Income.create(income_params)
    redirect_to expenses_path
  end

  def income_params
    params.require(:income).permit(:year_id, :month_id, :incomecategory_id, :money).merge(user_id: current_user.id)
  end
end
