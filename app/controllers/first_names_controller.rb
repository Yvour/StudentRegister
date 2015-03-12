class FirstNamesController < ApplicationController
  before_action :set_first_name, only: [:show, :edit, :update, :destroy]

  # GET /first_names
  # GET /first_names.json
  def index
    @first_names = FirstName.all
  end

  # GET /first_names/1
  # GET /first_names/1.json
  def show
  end

  # GET /first_names/new
  def new
    @first_name = FirstName.new
  end

  # GET /first_names/1/edit
  def edit
  end

  # POST /first_names
  # POST /first_names.json
  def create
    @first_name = FirstName.new(first_name_params)

    respond_to do |format|
      if @first_name.save
        format.html { redirect_to @first_name, notice: 'First name was successfully created.' }
        format.json { render :show, status: :created, location: @first_name }
      else
        format.html { render :new }
        format.json { render json: @first_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /first_names/1
  # PATCH/PUT /first_names/1.json
  def update
    respond_to do |format|
      if @first_name.update(first_name_params)
        format.html { redirect_to @first_name, notice: 'First name was successfully updated.' }
        format.json { render :show, status: :ok, location: @first_name }
      else
        format.html { render :edit }
        format.json { render json: @first_name.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /first_names/1
  # DELETE /first_names/1.json
  def destroy
    @first_name.destroy
    respond_to do |format|
      format.html { redirect_to first_names_url, notice: 'First name was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_first_name
      @first_name = FirstName.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def first_name_params
      params.require(:first_name).permit(:name)
    end
end
