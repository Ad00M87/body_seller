class CadaversController < ApplicationController
  before_action :set_cadaver, only: [:show, :edit, :update, :destroy]

  def index
    @cadavers = current_user.cadavers
  end

  def show
  end

  def new
    @cadaver = current_user.cadavers.new
  end

  def create
    @cadaver = current_user.cadavers.new(cadaver_params)
    if @cadaver.save
      redirect_to @cadaver, notice: 'Body Added'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @cadaver.update(cadaver_params)
      redirect_to @cadaver, notice: 'Body updated'
    else
      render :edit
    end
  end

  def destroy
    @cadaver.destroy
    redirect_to cadavers_url, notice: 'Body destroyed'
  end

  private

    def set_cadaver
      @cadaver = current_user.cadavers.find(params[:id])
    end

    def cadaver_params
      params.require(:cadaver).permit(
        :first_name,
        :age,
        :healthy,
        :fresh,
        :whole,
        :description,
      )
    end

end
