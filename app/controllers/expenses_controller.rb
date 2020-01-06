class ExpensesController < ApplicationController

  def toppage
    if user_signed_in?
      redirect_to  expenses_path
    end
  end

  def index
    @expense = Expense.new
    @expenses = Expense.all
    @user = current_user
    d = Date.today;
    @month_expenses = @user.expenses.where(year_id:2, month_id:d.month )
    @month_incomes = @user.incomes.where(year_id:2, month_id:d.month )

    @chart = {}
    unless @user.expenses[0].blank?
      @month_expenses.each do |b|
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

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    redirect_to expenses_path
  end

  def search_expense

    @expenses = Expense.all
    @user = current_user
    @month_expenses = @user.expenses.where(year_id:params[:year_id], month_id:params[:month_id])
    @month_incomes = @user.incomes.where(year_id:params[:year_id], month_id:params[:month_id])

    @chart = {}
    unless @user.expenses[0].blank?
      @month_expenses.each do |b|
        # @chart = { @user.expenses[0].expensecategory.name => @user.expenses[0].money , @user.expenses[1].expensecategory.name => @user.expenses[1].money }
        @chart.store(b.expensecategory.name, b.money)
      end
    end
    @ppp = "#{Month.find(params[:month_id]).name}の合計収入は"
    @qqq = "#{Month.find(params[:month_id]).name}の合計支出は"
  end
  


  def expense_params
    params.require(:expense).permit(:year_id, :month_id, :expensecategory_id, :money).merge(user_id: current_user.id)
  end

end
