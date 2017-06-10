class ShortnersController < ApplicationController
  before_action :set_shortner, only: [:show, :edit, :update, :destroy]


  def forward
    @shortners=Shortner.find_by(id: params[:url_id]) || Shortner.find_by(params[:short_url])
    redirect_to @shortners.long_url
  end
  
  # GET /shortners
  # GET /shortners.json
  def index
    @shortners = Shortner.all
  end

  # GET /shortners/1
  # GET /shortners/1.json
  def show
  end

  # GET /shortners/new
  def new
    @shortner = Shortner.new
  end

  # GET /shortners/1/edit
  def edit
  end

  # POST /shortners
  # POST /shortners.json
  def create
    @shortner = Shortner.new(shortner_params)

    respond_to do |format|
      if @shortner.save
        format.html { redirect_to @shortner, notice: 'Shortner was successfully created.' }
        format.json { render :show, status: :created, location: @shortner }
      else
        format.html { render :new }
        format.json { render json: @shortner.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shortners/1
  # PATCH/PUT /shortners/1.json
  def update
    respond_to do |format|
      if @shortner.update(shortner_params)
        format.html { redirect_to @shortner, notice: 'Shortner was successfully updated.' }
        format.json { render :show, status: :ok, location: @shortner }
      else
        format.html { render :edit }
        format.json { render json: @shortner.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shortners/1
  # DELETE /shortners/1.json
  def destroy
    @shortner.destroy
    respond_to do |format|
      format.html { redirect_to shortners_url, notice: 'Shortner was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shortner
      @shortner = Shortner.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shortner_params
      params.require(:shortner).permit(:long_url, :short_url, :active)
    end
end
