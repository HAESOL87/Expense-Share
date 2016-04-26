class ExpensesController < ApplicationController
  before_action :set_expense, :signed_in_user, only: [:show, :edit, :update, :destroy, :toggle_completed]

  # GET /expenses
  # GET /expenses.json
  def index
    @expenses = current_user.expenses.order(created_at: :desc)
  end

  # GET /expenses/1
  # GET /expenses/1.json
  def show
  end

  # GET /expenses/new
  def new
    @expense = Expense.new
  end

  # GET /expenses/1/edit
  def edit
  end

  # POST /expenses
  # POST /expenses.json
  def create
    @expense = Expense.new(expense_params)
    @expense.user = current_user

    calculate

    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_path, notice: 'Expense was successfully created.' }
        format.json { render :show, status: :created, location: @expense }
      else
        format.html { render :new }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenses/1
  # PATCH/PUT /expenses/1.json
  def update
    respond_to do |format|
      if @expense.update(expense_params)
        format.html { redirect_to expenses_path, notice: 'Expense was successfully updated.' }
        format.json { render :show, status: :ok, location: @expense }
      else
        format.html { render :edit }
        format.json { render json: @expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenses/1
  # DELETE /expenses/1.json
  def destroy
    @expense.destroy
    respond_to do |format|
      format.html { redirect_to expenses_path, notice: 'Expense was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_completed
   @expense.cleared = !@expense.cleared
    respond_to do |format|
      if @expense.save
        format.html { redirect_to expenses_path }
        format.json { render :show, status: :ok, location: @expense }
      else
        # show some error message
      end
    end
  end

  def calculate
    @expense.responsible_amount = (@expense.total_amount / @expense.total_person)

    @expense.amount_with_who = 'U really dont know'

    return @expense.responsible_amount
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:title, :total_amount, :total_person, :responsible_amount, :amount_payed, :amount_owed, :amount_with_who, :cleared, :comment)
    end
end
