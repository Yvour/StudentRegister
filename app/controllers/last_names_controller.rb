class LastNamesController < ApplicationController
  before_action :set_last_name, only: [:show, :edit, :update, :destroy]

  # GET /last_names
  # GET /last_names.json
  def index
    @last_names = LastName.all
  end

  # GET /last_names/1
  # GET /last_names/1.json
  def show
  end

  # GET /last_names/new
  def new
    @last_name = LastName.new
  end

  # GET /last_names/1/edit
  def edit
  end

  # POST /last_names
  # POST /last_names.json
  def create
    @last_name = LastName.new(last_name_params)

    respond_to do |format|
      if @last_name.save
        format.html { redirect_to @last_name, notice: 'Last name was successfully created.' }
        format.json { render :show, status: :created, location: @last_name }
      else
        format.html { render :new }
        format.json { render json: @last_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /last_names/1
  # PATCH/PUT /last_names/1.json
  def update
    respond_to do |format|
      if @last_name.update(last_name_params)
        format.html { redirect_to @last_name, notice: 'Last name was successfully updated.' }
        format.json { render :show, status: :ok, location: @last_name }
      else
        format.html { render :edit }
        format.json { render json: @last_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /last_names/1
  # DELETE /last_names/1.json
  def destroy
    @last_name.destroy
    respond_to do |format|
      format.html { redirect_to last_names_url, notice: 'Last name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_last_name
      @last_name = LastName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def last_name_params
      params.require(:last_name).permit(:name)
    end
end
