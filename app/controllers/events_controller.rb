class EventsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource



  def index
    terminado = Status.find_by_status_type_and_description('evento', 'TERMINADO').id
    hemeroteca = Status.find_by_status_type_and_description('evento', 'HEMEROTECA').id
    preliminar_terminado = Status.find_by_status_type_and_description('evento', 'PRELIMINAR TERMINADO').id

    #@events = Event.all
    @events = Event.where('status_id != ? and status_id != ? and status_id != ? ', terminado, hemeroteca, preliminar_terminado)
    @json = @events.to_gmaps4rails

#@json = Event.all.to_gmaps4rails
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }

    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @json=Event.find(params[:id]).to_gmaps4rails
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

# GET /events/new
# GET /events/new.json
  def new
    @event = Event.new
    @json = '[{"description":"<h4>Evento 10000</h4><h4>Periferico de la Juventud 4101, Colinas del Sol, Chihuahua</h4>","lat":"28.6352778","lng":"-106.0888889"}]'
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
  end

# GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
    @json = Event.find(params[:id]).to_gmaps4rails
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json




  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end


end


