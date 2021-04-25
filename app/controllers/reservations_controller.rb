class ReservationsController < ApplicationController
  before_action :set_reservation, only: %i[ show edit update destroy ]
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :search_reservation, only: [:index, :search]

  # GET /reservations or /reservations.json
  def index
    @reservations = Reservation.all
    set_reservation_column
  end

  def search
    @results = @p.result.all
  end

  # GET /reservations/1 or /reservations/1.json
  def show
    @participant = Participant.new
    #@participants = Participant.all
    @participants = @reservation.participants.all
    @comment = Comment.new
    @comments = @reservation.comments.all
  end

  # GET /reservations/new
  def new
    @reservation = Reservation.new
  end

  # GET /reservations/1/edit
  def edit
  end

  # POST /reservations or /reservations.json
  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: "Reservation was successfully created." }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reservations/1 or /reservations/1.json
  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: "Reservation was successfully updated." }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reservations/1 or /reservations/1.json
  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: "Reservation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reservation_params
      params.require(:reservation).permit(:start_time, :end_time, :min, :max, :level, :text, :area, :city_id).merge(user_id: current_user.id)
    end

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end

    def search_reservation
      @p = Reservation.ransack(params[:q]) 
    end

    def set_reservation_column
      @reservation_area = Reservation.select("area").distinct
      @reservation_level = Reservation.select("level").distinct
      @reservation_start_time = Reservation.select("start_time").distinct
    end
end
