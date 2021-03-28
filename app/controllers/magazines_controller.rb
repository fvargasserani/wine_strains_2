class MagazinesController < InheritedResources::Base

  private

    def magazine_params
      params.require(:magazine).permit(:name)
    end

end
