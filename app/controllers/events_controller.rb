class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :is_owner?, only: [:edit, :update, :destroy]
  before_action :is_customer_and_not?, only: [:show]
  before_action :is_admin_and_not?, only: [:show]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    if user_signed_in? # essaie de sauvegarder en base @gossip
      @event = Event.new

    else
      flash[:error] = "Il faut être enregistré pour créer un event"
      redirect_to new_user_session_path

    end

  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

      respond_to do |format|
        if @event.save
          format.html { redirect_to @event, notice: 'Event was successfully created.' }
          format.json { render :show, status: :created, location: @event }
        else
          format.html { render :new }
          format.json { render json: @event.errors, status: :unprocessable_entity }
        end
      end

  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location, :user_id)
    end

    def is_owner?
    if current_user != @event.user
      flash[:error] = "Tu ne peux pas accéder à une page qui ne t'appartient pas"
      redirect_to events_path
    end
    end

  def is_admin_and_not?
    if current_user == @event.user then
      @is_what = 1
    end
  end

  def is_customer_and_not?
    @attendance = Attendance.all

    if @attendance.select{|hash| hash["user_id"] == current_user.id }.empty?
      @is_what = 3
    else
      @is_what = 2
    end
  end
end
