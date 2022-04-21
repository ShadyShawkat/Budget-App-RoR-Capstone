class PaymentsController < ApplicationController
  before_action :set_payment, only: %i[show edit update destroy]
  before_action :category_params, only: %i[destroy]

  # GET /payments or /payments.json
  def index
    @payments = Payment.all
  end

  # GET /payments/1 or /payments/1.json
  def show; end

  # GET /payments/new
  def new
    @payment = Payment.new
    @user_categories = Category.where(user_id: current_user.id)
  end

  # GET /payments/1/edit
  def edit; end

  # POST /payments or /payments.json
  def create
    params = payment_params

    @payment = Payment.new(name: params[:name], amount: params[:amount])
    @payment.user_id = current_user.id
    category_ids = params[:category_ids]
    category_ids.each do |id|
      category = Category.find(id) unless id == ''
      @payment.categories.push(category) unless category.nil?
    end

    respond_to do |format|
      if @payment.save
        format.html { redirect_to categories_url, notice: 'Payment was successfully created.' }
        format.json { render :show, status: :created, location: @payment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /payments/1 or /payments/1.json
  def update
    respond_to do |format|
      if @payment.update(payment_params)
        format.html { redirect_to payment_url(@payment), notice: 'Payment was successfully updated.' }
        format.json { render :show, status: :ok, location: @payment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @payment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /payments/1 or /payments/1.json
  def destroy
    @payment.destroy
    @category = category_params

    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Payment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_payment
    @payment = Payment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def payment_params
    params.require(:payment).permit(:name, :amount, category_ids: [])
  end

  def category_params
    params.permit(:id)
  end
end
