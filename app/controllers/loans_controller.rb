# == Schema Information
#
# Table name: loans
#
#  id          :integer          not null, primary key
#  borrower_id :integer
#  book_id     :integer
#  start       :date
#  end         :date
#  returned    :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :edit, :update, :destroy]

  # GET /loans/new
  def new
    @loan = Loan.new
  end

  # POST /loans
  def create
    @loan = Loan.new(loan_params)
    respond_to do |format|
      format.html{
        if @loan.save
          redirect_to @loan.borrower, notice: 'Loan was successfully created.'
        else
          render :new
        end
      }
      format.js{
        if @loan.save
          redirect_via_turbolinks_to @loan.borrower, notice: 'Loan was successfully created.'
        else
          @message = "Unable to submit loan, because: #{@loan.errors.full_messages.to_sentence}"
          render 'error'
        end
      }
    end
  end

  # PATCH/PUT /loans/1
  def update
    if @loan.update(loan_params)
      @message = 'Loan was successfully updated.'
      render 'success'
    else
      @message = "Unable to submit loan, because: #{@loan.errors.full_messages.to_sentence}"
      render 'error'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_loan
      @loan = Loan.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def loan_params
      params.require(:loan).permit(:borrower_id, :book_id, :end, :returned)
    end
end
