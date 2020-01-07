class UsersController < ApplicationController

  def show
    @user = current_user
    @records = {}
    @user.expenses.each do |p|
      @records.store(p.expensecategory.name, p.money)
    end
    d = Date.today;
    @month_expenses = @user.expenses.where(year_id:d.year, month_id:d.month )
    @month_incomes = @user.incomes.where(year_id:d.year, month_id:d.month )
    # @chart = {}
    #   @month_expenses.each do |b|
    #     # @chart = { @user.expenses[0].expensecategory.name => @user.expenses[0].money , @user.expenses[1].expensecategory.name => @user.expenses[1].money }
    #     @chart.store(b.expensecategory.name, b.money)
    #   end
    @last_month_expenses = @user.expenses.where(year_id:d.last_month.year, month_id:d.last_month.month )
    @last_month_incomes = @user.incomes.where(year_id:d.last_month.year, month_id:d.last_month.month )
    
  end


end



