class WinesController < ApplicationController
  before_action :set_wine, only: %i[ show ]
  before_action :authenticate_user!
  before_action :authenticate_admin_user!, only: [:new, :edit, :update, :destroy]

  # GET /wines or /wines.json
  def index
    @wines = Wine.all
    @wine_strains = WineStrain.where(wine_id: :id)
    @wine_oenologists = WineOenologist.where(wine_id: :id)
  end

  # GET /wines/1 or /wines/1.json
  def show
  end
 
  # GET /wines/new
  def new
    @wine = Wine.new
    @strains = Strain.all.order(:name)
    @oenologists = Oenologist.all.order(:name)
  end

  # GET /wines/1/edit
  def edit
    @strains = Strain.all.order(:name)
    @oenologists = Oenologist.all.order(:name)
  end

  # POST /wines or /wines.json
  def create
    @wine = Wine.new(wine_params)
    @strains = Strain.all
    @wine.strains << @strains
    @oenologists = Oenologist.all
    @wine.oenologists << @oenologists

    respond_to do |format|
      if @wine.save
        format.html { redirect_to @wine, notice: "Wine was successfully created." }
        format.json { render :show, status: :created, location: @wine }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wines/1 or /wines/1.json
  def update
    respond_to do |format|
      if @wine.update(wine_params)
        format.html { redirect_to @wine, notice: "Wine was successfully updated." }
        format.json { render :show, status: :ok, location: @wine }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @wine.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wines/1 or /wines/1.json
  def destroy
    @wine.destroy
    respond_to do |format|
      format.html { redirect_to wines_url, notice: "Wine was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wine
      @wine = Wine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def wine_params
      params.require(:wine).permit(:name, :year, wine_strains_attributes: [:id, :wine_id, :strain_id, :percentage, :_destroy], strains_attributes: [:id, :name, :_destroy], wine_oenologists_attributes: [:id, :wine_id, :oenologist_id, :grade])
    end
end
