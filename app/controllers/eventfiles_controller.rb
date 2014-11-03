class EventfilesController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource

  def index

    @eventfiles = Eventfile.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eventfiles.map { |upload| upload.to_jq_upload } }

    end
  end

  # GET /eventfiles/1
  # GET /eventfiles/1.json
  def show
    @eventfile = Eventfile.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @eventfile }
    end
  end

# GET /eventfiles/new
# GET /eventfiles/new.json
  def new
    @eventfile = Eventfile.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @eventfile }
    end
  end

# GET /eventfiles/1/edit
  def edit
    @eventfile = Eventfile.find(params[:id])

  end

  # POST /eventfiles
  # POST /eventfiles.json
  def create
    @eventfile = Eventfile.new(params[:eventfile])

    respond_to do |format|
      if @eventfile.save
        format.html {
          render :json => [@eventfile.to_jq_upload].to_json,
                 :content_type => 'text/html',
                 :layout => false
        }
        format.json { render json: {files: [@eventfile.to_jq_upload]}, status: :created, location: @eventfile }
      else
        format.html { render action: "new" }
        format.json { render json: @eventfile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /eventfiles/1
  # PUT /eventfiles/1.json
  def update
    @eventfile = Eventfile.find(params[:id])

    respond_to do |format|
      if @eventfile.update_attributes(params[:eventfile])
        format.html { redirect_to @eventfile, notice: 'Eventfile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @eventfile.errors, status: :unprocessable_entity }
      end
    end
  end
  def put
    @eventfile = Eventfile.find(params[:id])
    @eventfile.visible = false
    @eventfile.save
  end
  # DELETE /eventfiles/1
  # DELETE /eventfiles/1.json
  def destroy
    @eventfile = Eventfile.find(params[:id])
    @eventfile.visible = false
    @eventfile.hide_reason = "Archivo equivocado"
    @eventfile.who_hide_file = current_user.username
    @eventfile.save


    render :json => true
  end
end
