class GrainsController < ApplicationController
  # before_action :set_grain, only: [:show, :edit, :update, :destroy]

  # GET /grains
  # GET /grains.json
  def index
    # @grains = Grain.all
  end

  # GET /grains/1
  # GET /grains/1.json
  def show
  end

  # GET /grains/new
  def new
    # @grain = Grain.new
  end

  # GET /grains/1/edit
  def edit
  end

  # POST /grains
  # POST /grains.json
  def create
    # @grain = Grain.new(grain_params)

    # respond_to do |format|
    #   if @grain.save
    #     format.html { redirect_to @grain, notice: 'Grain was successfully created.' }
    #     format.json { render :show, status: :created, location: @grain }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @grain.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /grains/1
  # PATCH/PUT /grains/1.json
  def update
    # respond_to do |format|
    #   if @grain.update(grain_params)
    #     format.html { redirect_to @grain, notice: 'Grain was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @grain }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @grain.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /grains/1
  # DELETE /grains/1.json
  def destroy
    # @grain.destroy
    # respond_to do |format|
    #   format.html { redirect_to grains_url, notice: 'Grain was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_grain
    #   @grain = Grain.find(params[:id])
    # end

    # # Never trust parameters from the scary internet, only allow the white list through.
    # def grain_params
    #   params.require(:grain).permit(:name, :extract)
    # end
end
