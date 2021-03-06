class CreditHoldersController < ApplicationController
  before_action :set_credit_holder, only: [:show, :edit, :update, :destroy]

  
  def list_credits
    @credit_holder = CreditHolder.find(params[:id])
    @credits = @credit_holder.credits
  end

  def transaction_history
    @transactions = Transaction.get_transactions(params[:id]).paginate(:per_page => 25, :page => params[:page])
    @credit_holder = CreditHolder.find(params[:id])
  end
  # GET /credit_holders
  # GET /credit_holders.json
  def index
    @credit_holders = CreditHolder.search(params[:search]).paginate(:per_page => 25, :page => params[:page])
    
    #@credit_holders = CreditHolder.all
  end

  # GET /credit_holders/1
  # GET /credit_holders/1.json
  def show
    @credits = CreditHolder.find(params[:id]).credits.where(:status => "active")
    @transactions = CreditHolder.find(params[:id]).transactions.where(:event => "use").order("created_at DESC").limit(5)
  end
  # GET /credit_holders/new
  def new
    @credit_holder = CreditHolder.new
  end

  # GET /credit_holders/1/edit
  def edit
  end

  # POST /credit_holders
  # POST /credit_holders.json
  def create
    @credit_holder = CreditHolder.new(credit_holder_params)

    respond_to do |format|
      if @credit_holder.save
        format.html { redirect_to @credit_holder, notice: 'Credit holder was successfully created.' }
        format.json { render :show, status: :created, location: @credit_holder }
      else
        format.html { render :new }
        format.json { render json: @credit_holder.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /credit_holders/1
  # PATCH/PUT /credit_holders/1.json
  def update
    respond_to do |format|
      if @credit_holder.update(credit_holder_params)
        format.html { redirect_to @credit_holder, notice: 'Credit holder was successfully updated.' }
        format.json { render :show, status: :ok, location: @credit_holder }
      else
        format.html { render :edit }
        format.json { render json: @credit_holder.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /credit_holders/1
  # DELETE /credit_holders/1.json
  def destroy
    @credit_holder.destroy
    respond_to do |format|
      format.html { redirect_to credit_holders_url, notice: 'Credit holder was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_credit_holder
      @credit_holder = CreditHolder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def credit_holder_params
      params.require(:credit_holder).permit(:first_name, :last_name, :phone_number, :address, :zip_code, :credits_total, :email_address, :contact_method)
    end
end
