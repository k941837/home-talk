class ExpensesController < ApplicationController

  def toppage
    if user_signed_in?
      redirect_to  expenses_path
    end
  end

  def index
    @user = current_user
    @chart = {}
    unless @user.expenses[0].blank?
      @user.expenses.each do |b|
        # @chart = { @user.expenses[0].expensecategory.name => @user.expenses[0].money , @user.expenses[1].expensecategory.name => @user.expenses[1].money }
        @chart.store(b.expensecategory.name, b.money)
      end
    end
  end
  

  def new
    @expense = Expense.new
  end

  def create
    Expense.create(expense_params)
    redirect_to expenses_path
  end


  def expense_params
    params.require(:expense).permit(:expensecategory_id, :money).merge(user_id: current_user.id)
  end

end
