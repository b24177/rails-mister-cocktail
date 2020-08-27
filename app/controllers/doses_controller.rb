class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @dose.cocktail = @cocktail
  end

  def create
    @dose = Dose.new(dose_params)
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def dose_params
    params.require(:cocktail).permit(:name, :description)
  end
end
