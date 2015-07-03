class StationsController < ApplicationController
  before_action :set_station, only: [:show, :edit, :update, :destroy]

  def index
    @stations = Station.all
  end

  def show
  end

  def new
    @station = StationForm.new
  end

  def edit
  end


  def create
    @station = StationForm.new(station_params)

    respond_to do |format|
      if @station.save
        format.html { redirect_to stations_path, notice: 'Station was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end


  def update
    respond_to do |format|
      if @station.update(station_params)
        format.html { redirect_to @station, notice: 'Station was successfully updated.' }
        format.json { render :show, status: :ok, location: @station }
      else
        format.html { render :edit }
        format.json { render json: @station.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @station.destroy
    respond_to do |format|
      format.html { redirect_to stations_url, notice: 'Station was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_station
      @station = Station.find(params[:id])
    end

    def station_params
      params.require(:station_form).permit(:station_name, :station_description, :address_url)
    end
end
