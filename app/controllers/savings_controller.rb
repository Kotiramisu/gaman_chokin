class SavingsController < ApplicationController
 before_action :set_saving, only: %i[show edit update destroy]

  def create
    @saving = current_savings.new(saving_params)
    if @saving.save
      redirect_to @saving, notice: "貯金記録登録が完了しました"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @saving = Saving.all.order(saved_at: :desc)
    @monthly_total = Saving.where(saved_at: Time.current.beginning_of_month..Time.current.end_of_month).sum(:amount)
  end

  def new
    @saving = current_user.savings.new
  end

  def show
  end

  def edit
  end

  def update
    if @saving.update(saving_params)
     redirect_to @saving, notice: "貯金記録情報を更新しました"
    else
     render :edit
    end
  end

  def destroy
    @saving.destroy
    redirect_to savings_path, notice: "貯金記録を削除しました"
  end

  private

  def saving_params
    params.require(:saving).permit(:title, :amount, :saved_at)
  end

  def set_saving
    @saving = Saving.find(params[:id])
  end
end
