class OenologistsController < InheritedResources::Base
  def index
    @oenologists = Oenologist.all
    @magazines = Magazine.where(id: (MagazineOenologist.joins(:oenologist)))
  end

  def new
    @oenologist = Oenologist.new
    @magazines = Magazine.all
  end

  def create
    @oenologist = Oenologist.new(oenologist_params)
    @magazines = MagazineOenologist.includes(:magazine).where(oenologist: :magazine).map(&:magazine)
    
    respond_to do |format|
      if @oenologist.save
        format.html { redirect_to @oenologist, notice: "Oenologist was successfully created." }
        format.json { render :show, status: :created, location: @oenologist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @oenologist.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_oenologist
    @oenologist = Oenologist.find(params[:id])
  end

  def oenologist_params
    params.require(:oenologist).permit(:name, :age, :nationality, magazine_oenologists_attributes: [:id, :magazine_id, :oenologist_id])
  end

end
