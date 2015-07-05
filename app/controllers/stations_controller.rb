class StationsController < ApplicationController

  def index
    @stations = Station.all
    @comments = Pole.all
  end

  def show
    @station = Station.find(params[:id])
  end

  def new
    @station = StationForm.new
  end


  def create
    @station = StationForm.new(station_params)

    if @station.save
      redirect_to stations_path, notice: 'Station was successfully created.'
    else
       render :new
    end
  end


  private
    def station_params
      params.require(:station_form).permit(:name,
        :comment, :email,:phone, :contract,:terms_of_service)
    end
end
