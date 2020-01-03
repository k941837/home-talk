class UsersController < ApplicationController

  def show
    @user = current_user
    @records = {}
    @user.expenses.each do |p|
      @records.store(p.expensecategory.name, p.money)
    end
  end
end



