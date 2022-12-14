class BookingsController < ApplicationController
  before_action :set_booking, only: %i[ show edit update destroy ]

  # GET /bookings or /bookings.json
  def index
    
    if current_user == nil
      redirect_to "/"
    elsif
      current_user.admin == true
      @bookings = Booking.all
    else
    
    current_user != nil 
    @bookings = Booking.where(user_id: current_user.id)
    end

  end

  # GET /bookings/1 or /bookings/1.json
  def show
    
    @booking = Booking.find_by(user_id: current_user.id)
    
  end

  # GET /bookings/new
  def new
  
    @booking = Booking.new
   
  end

  # GET /bookings/1/edit
  def edit
  end

  # POST /bookings or /bookings.json
  def create
    @booking = Booking.new(booking_params) do |c|
      c.user_id = current_user.id
    end

    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully created." }
        format.json { render :show, status: :created, location: @booking }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bookings/1 or /bookings/1.json
  def update
    respond_to do |format|
      if @booking.update(booking_params)
        format.html { redirect_to booking_url(@booking), notice: "Booking was successfully updated." }
        format.json { render :show, status: :ok, location: @booking }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1 or /bookings/1.json
  def destroy
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url, notice: "Booking was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_booking
      if current_user == nil
        redirect_to "/"
      else
      @booking = Booking.find(params[:id])
      end
    end

    # Only allow a list of trusted parameters through.
    def booking_params
      params.require(:booking).permit(:user_id, :first_name, :last_name, :animal_name, :animal_type, :requested_hours, :email, :service_date)
    end
end
