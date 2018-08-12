class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end


# class DosesController < ApplicationController
#     def index
#     @doses = Dose.all
#   end

#   def show
#     @dose = Dose.find(params[:id])
#   end

#   def new
#     @dose = Dose.new

#   end

#   def create
#     @dose = Dose.new(dose_params)

#     if @dose.save
#       redirect_to dose_path(@dose)
#     else
#       render :new
#     end


#   end

#   private

#   def dose_params
#     params.require(:dose).permit(:ingredient, :description)
#   end
# end

