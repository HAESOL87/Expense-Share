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

    @expense.responsible_amount = (@expense.total_amount / @expense.total_person)



    respond_to do |format|
      if @expense.save
        format.html { redirect_to edit_expense_path(@expense), notice: 'Expense was successfully created.' }
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
    calculate
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
    @expense.participant = []

    puts "!!!!#{params[:expense]}"

    puts "!!!!#{params[:expense].length}"

    puts "!!!!#{params[:expense].values.first}"

    @newValues = []
    @bigParticipant = []

    params[:expense].values.each do |k|
      @newValues.push(k)
    end


    for i in 1..params[:expense].length
      @expense.participant.push(@newValues.first)
      @newValues.shift

        if (i % 2 == 0)
          @p_amount2 = @expense.responsible_amount - @expense.participant[1].to_f
          @expense.participant.push(@p_amount2.to_s)
          @bigParticipant.push(@expense.participant)
          puts "1212#{@expense.participant}"
          puts "1313#{@bigParticipant}"
          @expense.participant = []
        end

    end

    # for i in 1..@expense.total_person
    #   x = params[:expense]["p1"]
    #   puts params[:expense]
    #   @expense.participant.push(params[:expense]["p1"])
    # end

    # puts "#{@expense.participant}"


#     puts @expense.participant

#     for i in 0..@expense.participant.length
#       if i %2 != 0 then
#         puts @expense.participant[i]
#         @expense.amount_net.push(@expense.responsible_amount - @expense.participant[i].to_i)
#       end
#     end

# puts "!!!!!#{@expense.amount_net}"

    @expense.amount_with_who = '??'

    return @expense.responsible_amount






  end









  private
    # Use callbacks to share common setup or constraints between actions.
    def set_expense
      @expense = Expense.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def expense_params
      params.require(:expense).permit(:title, :total_amount, :total_person, :responsible_amount, :amount_payed, :amount_owed, :amount_with_who, :cleared, :comment, :p1, :p2, :p3, :p4, :p5, :a1, :a2, :a3, :a4, :a5)
    end
end
